# Design: Los Pollos Hermanos

Requirements: `docs/PRD.md`. Terms: `docs/GLOSSARY.md`. Decisions: `docs/adr/`. Interfaces: `modules.md`. Diagram: `architecture.html` (open in a browser).

## 1. Problem & scope
A Flutter Android app where **Customers** buy fictional **Products** (in **Variants** by **Purity**/**Size**) from Los Pollos Hermanos. It's a closed market with one seller (ADR 0005), and the **Admin** (owner) runs the catalog, Stock and Orders. The hard parts are correct **Stock** and money when an Order is placed, role security, and offline browsing. Everything else is CRUD. Out of scope: see PRD §12.

## 2. Scale estimates
- Users: about 20 demo accounts. Peak is about 2 people using the app at once, so well under 1 request/s.
- Data: about 30 Products, 80 Variants and a few hundred Orders. That's under 5 MB of rows.
- Images: about 30 Products × 3 images × about 200 KB after resizing to 1280 px, which is about 18 MB. That's under 2% of the 1 GB Storage free tier.
- **What the numbers force:** nothing. There's no cache, queue or custom server. Everything fits Supabase's free tier on one Postgres. The real pressure is **correctness**: two Customers buying the last unit.

## 3. API (entry points)
The app talks to Supabase directly through `supabase_flutter`. RLS guards everything. **Writes that touch money, Stock, Order Status or bans go through Postgres functions (RPC).** Plain CRUD goes through table access (PostgREST).

### RPC functions (`security definer`, each checks the caller itself)
| Function | Caller | Does |
|---|---|---|
| `place_order(order_id uuid, items jsonb [{variant_id, qty}], address_id uuid, card_id uuid) → order_id` | Customer, not banned | Locks the Variants (`for update`), checks Stock and that nothing is Archived, decrements Stock, reads the Shipping Fee, computes Subtotal and Order Total, and writes the Order + Order Items (with snapshots). **Idempotent**: the app generates `order_id` once per tap, so a retry with the same id returns the existing Order. Errors: `OUT_OF_STOCK:<variant_id>`, `UNAVAILABLE:<variant_id>`, `CARD_DECLINED`, `BANNED`, `EMPTY_CART`. |
| `cancel_order(order_id)` | The buyer (before Shipped), Admin (before Delivered) | Sets Cancelled and restores Stock |
| `set_order_status(order_id, status)` | Admin | Next step only: paid → packed → shipped → delivered |
| `set_ban(user_id, banned bool)` · `set_shipping_fee(amount)` | Admin | |
| `admin_dashboard() → {revenue, orders_by_status jsonb, customer_count, low_stock_count}` | Admin | |

### Table access (RLS-guarded CRUD)
- Catalog reads (logged-in users only; the `anon` role gets nothing): `pharmacists`, `product_cards` view, `products`, `product_variants`, `product_images`, `categories`, `reviews`. Customers see non-archived pharmacists and can filter `product_cards` by `pharmacist_id`; only the Admin may write pharmacists.
- Search: `ilike '%q%'` on product name, filters on Category and Tier, sorted by newest, price or rating.
- Paging: `.range(from, from+19)`, 20 per page.
- Customer: own `addresses` and `cards`, own `orders` and `order_items` (read only), insert own `reviews`.
- Admin: insert/update/delete on `products`, `product_variants`, `product_images` and `categories`. Read everything.
- Storage: bucket `product-images` (path `{product_id}/...`) is public read by URL (fictional product photos), and only the Admin can write. Avatars go in bucket `avatars` (path `{user_id}/...`), and only the owner can write. Pharmacist photos are plain `photo_url` values (no Storage bucket).
- `place_order` keeps its signature and still creates exactly one Order; it snapshots the source `pharmacist_name` onto each Order Item. The Cart is global, so one Order may contain lines from several pharmacists.

### Auth
- Email/password: `signUp` with `data: {full_name}`. The `handle_new_user` trigger creates the `profiles` row with role `customer`, **always**.
- Google: `signInWithOAuth(OAuthProvider.google, redirectTo: 'com.lospolloshermanos.app://login-callback')` opens the browser, then a deep link brings the user back. The same deep link handles email confirmation and password reset.
- Admins are created by the seed tool, which sets `role = 'admin'` with the service key. Pharmacists are catalog records managed by the Admin, never auth Users and never a Role.

## 4. High-level design
```
Phone ──────────────────────────────────────────┐
│ features/ (screens)  ── frontend              │
│   | Riverpod controllers (AsyncValue)         │
│ data/ repositories   ── backend  ◄── the seam │
│   ├── sqflite: cart, cached products/categories
│   └── supabase_flutter ─────────────┐         │
└─────────────────────────────────────│─────────┘
                                      ▼  HTTPS + JWT
Supabase: Auth (email, Google) · PostgREST + RPC · Storage
          Postgres: tables + RLS + functions + triggers + views
```
| Component | Why it's there |
|---|---|
| Flutter app: go_router + Riverpod | FR-1..18 screens. Route guards (UX only) read `currentUserProvider`. |
| Repositories (`lib/data`) | The single place that touches Supabase or sqflite, and the team contract (`modules.md`) |
| sqflite | FR-7 offline cart, FR-18 offline browsing |
| Supabase Auth | FR-1..3, including Google (FR-2) and email confirmation via the built-in sender (ADR 0004) |
| Postgres + RLS | Every security rule (NFR-4) |
| Postgres functions | Stock and money correctness (NFR-3, ADR 0001), status transitions, bans |
| Storage | Product images and avatars |

## 5. Data model (one Postgres, `public` schema)
| Table | Key columns |
|---|---|
| `profiles` | `id` = auth.users.id, full_name, phone, avatar_url, `role` (customer/admin), `is_banned`, created_at |
| `pharmacists` | id, name, photo_url, specialty (nullable), `archived`, created_at; Admin-managed employees, never auth Users |
| `categories` | id, name unique, icon |
| `products` | id, `pharmacist_id` (uuid, not null, references pharmacists), category_id, name, description, `archived`, created_at |
| `product_variants` | id, product_id, `purity numeric(4,1)` check 0–100, size_label, `price numeric(10,2)` check > 0, `stock int` check ≥ 0, `archived` |
| `product_images` | id, product_id, path, sort_order |
| `addresses` / `cards` | user_id, …, is_default. Cards hold **brand, last4, exp_month, exp_year only** |
| `settings` | single row: `shipping_fee numeric(10,2)` default 50 |
| `orders` | id (from the app, used for idempotency), customer_id, `status`, subtotal, shipping_fee, total, `shipping_address jsonb` (snapshot), card_brand, card_last4, created_at, status_updated_at |
| `order_items` | id, order_id, variant_id, product_id, product_name, `pharmacist_name`, variant_label, `unit_price`, qty |
| `reviews` | id, `order_item_id` unique, product_id, customer_id, rating 1–5, comment, created_at |

- **Tier** is never stored. The `tier_of(purity)` SQL function and `Tier.fromPurity` in Dart use the same thresholds (<80, <99, ≥99), and a unit test pins the Dart side.
- **View `product_cards`** (`security_invoker`): product + category + `pharmacist_id`, `pharmacist_name`, `pharmacist_photo_url` + min/max price + max purity + total available stock + average rating + review count, over products that aren't archived and whose pharmacist isn't archived. The pharmacist-products list and search read this view; the directory reads `pharmacists` directly. The Admin's product list reads `products` directly, so it sees archived ones too.
- **Low Stock:** non-archived Variants with `stock <= 5`.
- **Indexes:** the foreign keys (`products.pharmacist_id`, `products.category_id`, `product_variants.product_id`, `orders.customer_id`, `order_items.order_id`, `reviews.product_id`) plus `orders.status`.
- **IDs:** `uuid` everywhere. `orders.id` is generated in the app.

### Local (sqflite, `app.db`, version-numbered `onUpgrade`)
- `cart_items(variant_id pk, qty, added_at)`
- `cached_product_cards(key pk, json, cached_at)`
- `cached_categories(id pk, json)`

The cart has **no server copy**: it is sent as `items` to `place_order`.

## 6. Key decisions & trade-offs
| Decision | Solves | Worsens | Change it when… |
|---|---|---|---|
| App → Supabase directly, no custom backend server | Nothing to host or deploy. Fits a 1-week deadline. | All rules must be expressed in RLS + SQL functions, which are harder to unit-test than Dart | Logic needs a third-party API with secret keys (real payments): add a Supabase Edge Function for that step only |
| Money, Stock, status and ban changes only through `security definer` RPCs | One transaction, no overselling, Customers can't forge prices (ADR 0001) | Backend writes PL/pgSQL. Bugs show up as SQL errors. | A function grows past ~100 lines or needs external calls |
| Closed market, one seller (ADR 0005) | No Stores, no per-Store split, simpler RLS (customer vs admin) | Turning it into a marketplace later needs store ownership everywhere | The owner wants other sellers |
| Pharmacist as a catalog entity, not an account or Seller | Directory and per-pharmacist catalog without a third Role or login | One extra table, FK and filter; no pharmacist-side ownership of money | Pharmacists need their own login or to sell their own stock |
| Cart lives only in sqflite and is passed to `place_order` | Works offline with no sync logic and no cart table | The cart doesn't follow the user to another device or survive a reinstall | Users need the cart on several devices |
| `product_cards` view computes price range, rating and stock at read time | One query per page, no stored counters to keep in sync | Each read re-aggregates | Home page p95 > 500 ms, or more than ~10k reviews: move to trigger-maintained columns |
| Client-generated `order_id` makes `place_order` idempotent | A double tap or a retry after a dropped connection never creates two Orders | The app must keep the id until it gets a success or a definite failure | Never, at this scale |
| Google via `signInWithOAuth` (browser + deep link) | One Google "Web" OAuth client, no SHA-1 setup per machine, and it reuses the email deep link | A browser hop on login | The app is shipped to Play Store users: switch to native `signInWithIdToken` |

## 7. Failure modes & degradation
| Failure | What the user sees | Handling |
|---|---|---|
| No internet | "You're offline" banner. Cached catalog and full cart still work. Checkout and edits are disabled. | `connectivity_plus` plus catching repository errors |
| Network drops while placing an Order | A spinner, then "Couldn't confirm. Retry." | Retrying with the **same** `order_id` returns the existing Order or places it once |
| Last unit sold to someone else | "Blue Sky Cough Relief · 99.1% · 100ml just sold out" | `place_order` raises `OUT_OF_STOCK:<id>`. The cart marks that line and nothing is charged. |
| Variant archived while in the cart | The cart line shows "No longer available" | The cart re-reads its Variants when opened, and `place_order` re-checks |
| Pharmacist archived while browsing | Its Products disappear from the shop, a cart line from it fails checkout, and past Orders still show the pharmacist name | Archived pharmacists are filtered from the directory and `product_cards`, and `place_order` raises `UNAVAILABLE` for them |
| Image upload fails while the Admin saves a Product | "Saved without some images. Retry upload." | Product row first, then images |
| Expired session | Nothing visible | `supabase_flutter` refreshes the token. If refresh fails, the router sends the user to /login. |
| Supabase project paused (free plan, 7 days idle) | Every call fails | Open the dashboard in the week before the demo (NFR-6) |
| Confirmation email not delivered | User stuck on "confirm your email" | Built-in sender limits (ADR 0004) |

There is one single point of failure (Supabase itself), accepted at this scale. The app degrades to read-only from its cache.

## 8. Scale evolution
The first thing to slow down is search together with the `product_cards` view (`ilike` and per-read aggregates), at around 10k Products or reviews. The fix then: a `pg_trgm` index or Postgres full-text search, then trigger-maintained rating/price columns.

## 9. Open questions
- None blocking. Logs and SLOs are deferred: the Supabase dashboard logs are enough for a class demo.
