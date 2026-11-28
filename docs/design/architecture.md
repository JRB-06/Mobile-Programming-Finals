# Design: Los Pollos Hermanos

Requirements: `docs/PRD.md`. Terms: `docs/GLOSSARY.md`. Decisions: `docs/adr/`. Diagram: `architecture.html` (open in a browser).

## 1. Problem & scope
A Flutter Android app where **Customers** buy fictional **Products** (in **Variants** by **Purity**/**Size**) from **Stores** run by approved **Pharmacists**, and **Admins** moderate. The hard parts are correct **Stock** and money at **Checkout**, role security, and offline browsing. Everything else is CRUD. Out of scope: see PRD.

## 2. Scale estimates
- Users: about 20 demo accounts. Peak is about 2 people using the app at once during a demo, so well under 1 request/s.
- Data: about 8 Stores, 50 Products, 150 Variants and a few hundred Orders. That's under 5 MB of rows.
- Images: about 50 Products × 3 images × about 200 KB after resizing to 1280 px, which is about 30 MB. That's under 3% of the 1 GB Storage free tier.
- **What the numbers force:** nothing. There's no cache, queue, sharding or custom server. Everything fits in Supabase's free tier on one Postgres. The only real pressure is **correctness**: two Customers buying the last unit.

## 3. API (entry points)
The app talks to Supabase directly through `supabase_flutter`. RLS guards everything. **All writes that touch money, Stock, Order Status or Role go through Postgres functions (RPC)**. Plain CRUD goes through table access (PostgREST).

### RPC functions (`security definer`, each checks the caller's Role itself)
| Function | Caller | Does |
|---|---|---|
| `place_order(checkout_id uuid, items jsonb [{variant_id, qty}], address_id uuid, card_id uuid) → checkout_id` | Customer, not banned | Locks Variants (`for update`), checks Stock and that nothing is Archived/Hidden/banned, decrements Stock, reads the Shipping Fee, computes Subtotal / Platform Fee (`round(subtotal*0.02, 2)`) / Order Total per Store, and writes the Checkout + Orders + Order Items (with snapshots). **Idempotent**: the app generates `checkout_id` once per tap, so a retry with the same id returns the existing Checkout. Errors: `OUT_OF_STOCK:<variant_id>`, `UNAVAILABLE:<variant_id>`, `EMPTY_CART`. |
| `cancel_order(order_id)` | buyer (before Shipped), Admin | Sets Cancelled and restores Stock |
| `set_order_status(order_id, status)` | Store's Pharmacist (next step only), Admin (any) | Enforces paid→packed→shipped→delivered |
| `apply_as_pharmacist(store_name)` | Customer with no Orders | Creates a pending Store (used by Google sign-ups) |
| `review_application(store_id, approve bool)` | Admin | Approve: Store goes live. Reject: Role becomes Customer and the notice flag is set. |
| `set_ban(user_id, banned bool)` · `set_product_hidden(product_id, hidden bool)` · `set_shipping_fee(amount)` | Admin | |
| `admin_stats() → {platform_revenue, gmv, order_count, pending_pharmacists}` | Admin | |
| `store_earnings() → {earnings, delivered_count}` | Pharmacist | |

### Table access (RLS-guarded CRUD)
- Read the shop (logged-in users only; the `anon` role gets no table access): `stores`, `product_cards` view, `products`, `product_variants`, `product_images`, `categories`, `reviews`.
- Paging: `.range(from, from+19)`, 20 per page, offset paging (fine at this size).
- Search: `ilike '%q%'` on `stores.name` (Home and the Search tab search Stores only). Inside a Store: filter `product_cards` by Category and Tier, sorted by newest, price or rating.
- Customer: own `addresses` and `cards`, own `orders`/`order_items`/`checkouts` (read), insert own `reviews`.
- Pharmacist: own store's `products`/`product_variants`/`product_images` (insert/update), own store's `orders` (read).
- Storage: buckets `product-images` (path `{store_id}/...`) and `store-logos`. Public read by URL (fictional product photos only; a private bucket would need signed URLs), and only the Store's owner can write.

### Auth
- Email/password: `signUp` with `data: {role, full_name, store_name?}`. The `handle_new_user` trigger creates the `profiles` row. **It only accepts `customer` or `pharmacist`**, so a forged `admin` value becomes a customer. For a pharmacist it also creates a pending Store.
- Google: `signInWithOAuth(OAuthProvider.google, redirectTo: 'com.lospolloshermanos.app://login-callback')` opens the browser, then a deep link brings the user back. The same deep link handles email confirmation and password reset. Google users start as Customers and can apply via `apply_as_pharmacist`.

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
| Flutter app: go_router + Riverpod | FR-1..20 screens. Route guards (UX only) read the auth/profile provider. |
| Repositories (`lib/data`) | The single place that touches Supabase or sqflite, and the team contract (PRD §14) |
| sqflite | FR-7 offline cart, FR-20 offline browsing |
| Supabase Auth | FR-1..3, including Google (FR-2) and email confirmation via the built-in sender (ADR 0004) |
| Postgres + RLS | Every security rule (NFR-4) |
| Postgres functions | Stock and money correctness (NFR-3, ADR 0001), status and role transitions |
| Storage | Product images and Store logos (FR-12/13) |

## 5. Data model (one Postgres, `public` schema)
| Table | Key columns |
|---|---|
| `profiles` | `id` = auth.users.id, full_name, phone, avatar_url, `role` (customer/pharmacist/admin), `is_banned`, `application_rejected` bool |
| `stores` | id, `owner_id` unique → profiles, name, description, logo_url, `status` (pending/approved/rejected) |
| `categories` | id, name unique, icon |
| `products` | id, store_id, category_id, name, description, `archived`, `hidden`, created_at |
| `product_variants` | id, product_id, `purity numeric(4,1)` check 0–100, size_label, `price numeric(10,2)` check > 0, `stock int` check ≥ 0, `archived` |
| `product_images` | id, product_id, path, sort_order |
| `addresses` / `cards` | user_id, …, is_default. Cards hold **brand, last4, exp_month, exp_year only** |
| `settings` | single row: `shipping_fee numeric(10,2)` default 50, `platform_fee_rate numeric(4,3)` default 0.02 |
| `checkouts` | id (from the app, used for idempotency), customer_id, card_brand, card_last4, created_at |
| `orders` | id, checkout_id, store_id, customer_id, `status`, subtotal, shipping_fee, platform_fee, total, `shipping_address jsonb` (snapshot), status_updated_at |
| `order_items` | id, order_id, variant_id, product_id, product_name, variant_label, `unit_price`, qty |
| `reviews` | id, `order_item_id` unique, product_id, customer_id, rating 1–5, comment |

- **Tier** is never stored. The `tier_of(purity)` SQL function and `Tier.fromPurity` in Dart both use the same thresholds (<80, <99, ≥99), and a unit test pins the Dart side.
- **View `product_cards`** (`security_invoker`): product + store name + min/max price + max purity + available stock + avg rating + review count. It only includes products that aren't archived or hidden, from approved Stores whose owner isn't banned. Home, search and store pages all read this view.
- **Indexes:** FKs (`products.store_id`, `product_variants.product_id`, `orders.store_id`, `orders.customer_id`, `order_items.order_id`). Nothing more is needed at this size.
- **IDs:** `uuid` everywhere (`gen_random_uuid()`). `checkout_id` is generated in the app.

### Local (sqflite, `app.db`, version-numbered `onUpgrade`)
- `cart_items(variant_id pk, qty, added_at)`
- `cached_product_cards(id pk, json, cached_at)`
- `cached_categories(id pk, json)`
- Stretch: `recent_searches`, `favorites`, `product_drafts`.

The cart has **no server copy**: it is sent as `items` to `place_order`.

## 6. Key decisions & trade-offs
| Decision | Solves | Worsens | Change it when… |
|---|---|---|---|
| App → Supabase directly, no custom backend server | Nothing to host or deploy. Fits a 1-week deadline. | All rules must be expressed in RLS + SQL functions, which are harder to unit-test than Dart | Logic needs a third-party API with secret keys (real payments): add a Supabase Edge Function for that step only |
| Money, Stock, status and Role changes only through `security definer` RPCs | One transaction, no overselling, Customers can't forge prices (ADR 0001) | Backend writes PL/pgSQL. Bugs show up as SQL errors. | A function grows past ~100 lines or needs external calls: move it to an Edge Function |
| Cart lives only in sqflite and is passed to `place_order` | Works offline (FR-7) with no sync logic and no cart table or RLS | The cart doesn't follow the user to another device or survive a reinstall | Users need the cart on several devices: add `cart_items` table with last-write-wins sync |
| `product_cards` view computes price range, rating and stock at read time | One query per page, no stored counters to keep in sync | Each read scans its reviews/variants. Grows with data. | Home page p95 > 500 ms, or more than ~10k reviews: move to columns maintained by triggers, or a materialized view |
| Client-generated `checkout_id` makes `place_order` idempotent | A double tap or a retry after a dropped connection never creates two Checkouts | The app must keep the id until it gets a success or a definite failure | Never, at this scale |
| Google via `signInWithOAuth` (browser + deep link) instead of the native `google_sign_in` | One Google "Web" OAuth client, no SHA-1 setup per machine, and it reuses the deep link already needed for email links | A browser hop on login, which is slightly less smooth | The app is shipped to Play Store users: switch to native `signInWithIdToken` |
| Riverpod + go_router + repositories as the backend/frontend seam | Two people work in parallel against fake repositories first (PRD §14) | Codegen step (`build_runner`) and more files | Never for this project |

## 7. Failure modes & degradation
| Failure | What the user sees | Handling |
|---|---|---|
| No internet | "You're offline" banner. Cached shop and full cart still work. Checkout, posting and edits are disabled. | `connectivity_plus` plus catching repository errors |
| Network drops during checkout | A spinner, then "Couldn't confirm. Retry." | Retrying with the **same** `checkout_id` returns the existing Checkout or places it once |
| Last unit sold to someone else | "Blue Sky Cough Relief · 99.1% is sold out" | `place_order` raises `OUT_OF_STOCK:<id>`. The cart marks that line and nothing is charged. |
| Variant archived/hidden while in cart | The cart line shows "No longer available" | The cart re-reads its variants when opened. `place_order` re-checks. |
| Image upload fails while saving a product | "Saved without some images. Retry upload." | Product row first, then images. Missing images can be re-uploaded from the edit screen. |
| Expired session | Nothing visible | `supabase_flutter` refreshes the token. If refresh fails, the router sends the user to /login. |
| Supabase project paused (free plan, 7 days idle) | Every call fails | Open the dashboard in the week before the demo (NFR-6) |
| Confirmation email not delivered | User stuck on "confirm your email" | Built-in sender limits (ADR 0004). Demo with team-member accounts or Google, or turn off confirmation. |

There is one single point of failure (Supabase itself), accepted at this scale. The app degrades to read-only from its cache.

## 8. Scale evolution
The first thing to break is search and the `product_cards` view (`ilike` and per-read aggregates), at around 10k Products or reviews. The next steps would be a `pg_trgm` index or Postgres full-text search, then trigger-maintained rating/price columns. After that, keyset paging instead of `range`. The signal to act is home or search p95 above 500 ms in the Supabase dashboard.

## 9. Open questions
- App id: `com.lospolloshermanos.app`, with the deep link `com.lospolloshermanos.app://login-callback`.
- Coverage sweep: media covered (Storage, resize before upload). IDs covered (uuid). Search covered (`ilike`, deferred upgrade above). Logs and SLOs are deferred: the Supabase dashboard logs are enough for a class demo.
