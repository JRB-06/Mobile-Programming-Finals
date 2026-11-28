# Los Pollos Hermanos: Product Requirements Document

The online pharmacy of **Los Pollos Hermanos**, themed after Breaking Bad and built with Flutter, Supabase and sqflite. It's a **closed market**: Los Pollos Hermanos is the only seller (ADR 0005). It's a final project for the Mobile Programming course, due the **first week of December 2026**. All products, money, cards and addresses are * mock data**.

Related docs:
- Screen flow and components: `docs/ARCHITECTURE.md`
- Designer handbook: `docs/design/`
- Technical design: `docs/technical/architecture.md`
- The backend/frontend contract: `docs/technical/modules.md`
- Terms: `docs/GLOSSARY.md`
- Decisions: `docs/adr/`
- Environment setup: `docs/SETUP.md`

---

## 1. Overview & Goals

**One sentence:** an Android app where Customers pick a pharmacist and buy that pharmacist's medicines from Los Pollos Hermanos. Each Product comes in purity/size Variants with their own Stock, and the owner (Admin) runs the pharmacists, catalog, Stock and Orders.

| Goal | Success measure |
|---|---|
| Customers can shop | Find a pharmacist, browse their Products, pick a Variant, check out, and track the Order to Delivered |
| The owner runs the shop | Add a Product with Variants and images, restock, move an Order to Delivered, see Revenue |
| Secure auth and roles | Email or Google login. A Customer calling the API directly still can't read other Users' data or change Stock or prices. |
| Correct Stock and money | Two Customers racing for the last unit: exactly one succeeds. Totals always equal subtotal + shipping. |
| Works offline for browsing | Cart and last-loaded Products are available without internet |

**Theme:** a chemistry-lab look, purity percentages, and the Tier badges (Street / Pharma / Blue Sky). Product names are; no real drug names.

**Platform:** Android. Development and testing happen on the Pixel 8 emulator (API 35, compile SDK 36). The release APK is also installed on a **Samsung Galaxy Tab A7** tablet (10.4", Android 12 at most, arm64), so min SDK 24 covers it and layouts must adapt to the tablet width.

---

## 2. Roles & Access

Every screen requires login. There is no guest browsing.

| Capability | Customer | Admin (owner) |
|---|:-:|:-:|
| Browse and search Pharmacists and their Products, view Reviews | Yes | Yes |
| Cart, checkout, own Orders, cancel before Shipped | Yes | No |
| Review a Product after its Order is Delivered | Yes | No |
| Manage own profile, Addresses and Cards | Yes | No |
| Create, edit and archive Products, Variants, Stock and images | No | Yes |
| Manage Categories | No | Yes |
| View all Orders, move them Paid → Packed → Shipped → Delivered, cancel before Delivered | No | Yes |
| Ban / unban Customers | No | Yes |
| Set the Shipping Fee | No | Yes |
| Dashboard (Revenue, Orders, Customers, Low Stock) | No | Yes |
| Create, edit and archive Pharmacists | No | Yes |

A **Pharmacist** is a catalog record managed by the Admin, not a Role: there is no pharmacist signup or login.

**How a User gets a Role:**
- **Customer:** every signup, by email or Google.
- **Admin:** created only through seed data. The signup trigger always creates Customers.

A **banned** Customer can log in and browse, but can't place Orders or write Reviews.

**Enforcement:**
1. **Supabase Row Level Security** on every table, plus `security definer` database functions for money, Stock, Order Status and bans. This is the real security.
2. **`go_router` redirects:** logged-out users go to login, Customers to Home, the Admin to the Admin Page.
3. **UI:** each Role only sees its own navigation.

Layers 2 and 3 are UX only.

---

## 3. Authentication (Supabase Auth)

| Flow | Details |
|---|---|
| Sign up | Name, email, password (min 8 characters, 1 number). Uses `supabase.auth.signUp`. The `handle_new_user` trigger creates the profile as a Customer. |
| Email confirmation | Supabase sends a link. The deep link `com.lospolloshermanos.app://login-callback` opens the app and logs the User in. **The built-in sender only delivers to Supabase team members** (ADR 0004). |
| Log in | Email + password (`signInWithPassword`), or **Continue with Google** (`signInWithOAuth`, which goes through the browser and comes back via the same deep link). Unconfirmed accounts see "Please confirm your email" with a resend button. |
| Forgot password | `resetPasswordForEmail`. The deep link opens a "Set new password" screen. |
| Session | Persisted by `supabase_flutter`. Splash checks the session and Role, then routes to Home or the Admin Page. |
| Log out | `signOut`, then clear the User's sqflite data (cart, cache). |

---

## 4. Functional Requirements

### Auth & accounts
- **FR-1** Sign up with email and password, as a Customer. Email confirmation is required.
- **FR-2** Log in with email and password, or with Continue with Google.
- **FR-3** Forgot / reset password. The session persists. Logout clears local data.
- **FR-4** Banned Customers can browse but can't place Orders or write Reviews, and they see a notice.

### Customer
- **FR-5A** Home is a pharmacist directory:
  - Search Pharmacists by name and specialty.
  - Selecting one opens its Products (C-01A); archived Pharmacists never appear.
- **FR-5** After a pharmacist is selected, the catalog lists that pharmacist's Products:
  - Search Products by name.
  - Filter by Category and Tier.
  - Sort by newest, price or rating.
  - Product cards show image, name, price range, best Tier and rating.
- **FR-6** A Product page shows the source pharmacist, images, description, rating, Reviews, and Variants (Purity %, Tier badge, Size, price, Stock).
- **FR-7** Cart:
  - Add a Variant. Out-of-stock Variants can't be added, and quantity can't go above Stock.
  - The Cart always shows current prices and works offline.
- **FR-8** Checkout:
  - Pick an Address and a Card.
  - See Subtotal, Shipping Fee and Order Total.
  - Placing the Order takes the Stock in one transaction.
  - If a Variant sold out or was archived, checkout fails, names that Variant, and charges nothing.
- **FR-9** My Orders, with a status timeline. Cancel an Order before it ships, which gives a full mock Refund and restores the Stock. Only whole Orders can be cancelled.
- **FR-10** Review a Product (1–5 stars + comment) from a Delivered Order Item, at most once per Order Item. The Review shows which Variant was bought.
- **FR-11** Profile:
  - Edit profile.
  - Manage Addresses (with one default).
  - Manage Cards: the number is Luhn-checked, and only brand, last 4 and expiry are saved.

### Admin (owner)
- **FR-12A** Pharmacists:
  - Create and edit Pharmacists: name, photo URL, optional specialty.
  - Archive Pharmacists; a Product always belongs to exactly one pharmacist.
- **FR-12** Products:
  - Create and edit Products: name, description, Category, assigned Pharmacist, up to 5 images.
  - Manage Variants (Purity, Size, price, Stock).
  - Archive Products and Variants. Never-ordered items can be deleted.
- **FR-13** Manage Categories.
- **FR-14** View all Orders, filtered by status. Move an Order one step at a time (Paid → Packed → Shipped → Delivered), or cancel it before Delivered.
- **FR-15** Customers: search them, and ban or unban.
- **FR-16** Settings: set the Shipping Fee (new Orders only).
- **FR-17** Dashboard:
  - Revenue (Delivered Orders).
  - Order count by status.
  - Customer count.
  - Low-Stock Variants (5 or fewer left).

### Offline
- **FR-18** With no internet, show the cached Products and Categories, and the Cart, under an offline banner. Checkout and all editing are disabled.

---

## 5. Money & Stock Rules

| Rule | Value |
|---|---|
| Currency | Philippine peso (₱), 2 decimals. No VAT, no other tax, no platform fee. |
| Shipping Fee | Flat **₱50 per Order**, changeable by the Admin for future Orders |
| Order Total | Subtotal + Shipping Fee |
| Where it's computed | Only in the database (`place_order`). The app sends Variant ids + quantities, never prices (ADR 0001). |
| Stock | Decremented in the same transaction as the Order. Can never go below 0. Restored on cancel. |
| Price changes | The Cart shows current prices. Order Items keep the price paid (ADR 0003). |
| Refund | A cancelled Order is refunded in full (mock) and doesn't count toward Revenue |
| Revenue | The sum of Order Totals of **Delivered** Orders |

Example Order:
```
Blue Sky Cough Relief · 99.1% · 100ml   1 × ₱450.00
Blue Sky Cough Relief · 70.0% · 100ml   1 × ₱180.00
Subtotal                                  ₱630.00
Shipping                                   ₱50.00
Total                                     ₱680.00
```

**Mock cards:**
- Test numbers: `4242 4242 4242 4242` (Visa), `5555 5555 5555 4444` (Mastercard), `3782 822463 10005` (Amex). The number `4000 0000 0000 0002` simulates a **declined** card: a saved Card ending in `0002` is declined by `place_order`.
- Validation: Luhn check, expiry not in the past, CVV 3–4 digits. The CVV is never stored.
- Checkout shows a ~2-second "Processing payment…" state.

---

## 6. Screens

The flow is in `docs/ARCHITECTURE.md` §2. Every screen's content, actions and states are in `docs/design/screens.md`.

**UI design: To be decided.** The visual direction, theme and screen layouts are owned by the frontend partner and will be recorded in `DESIGN.md` once decided.

| Role | Screens |
|---|---|
| All | Splash, Login, Sign up, Forgot password, Reset password, Check your email |
| Customer | Top bar: logo, Cart. Bottom nav: Search, Profile. Home (pharmacist directory), Pharmacist products, Product detail, All reviews, Cart, Checkout, Order placed, My Orders, Order detail, Write review, Profile, Edit profile, Addresses, Cards |
| Admin | Dashboard, Products, Product editor, Pharmacists, Pharmacist editor, Categories, Orders, Order detail, Customers, Settings |

Every screen that loads data has loading, empty, error (with retry) and offline states.

---

## 7. Local Storage (sqflite)

Supabase is the **source of truth**. sqflite holds **local-only data and an offline cache**.

| Local table | Purpose |
|---|---|
| `cart_items` | The Cart. There's no server copy: it's sent to `place_order` at checkout. |
| `cached_product_cards` | Last-loaded catalog pages, for offline browsing |
| `cached_categories` | Categories for offline filters |

Rules:
- **Reading:** show the cache instantly, then fetch from Supabase and refresh both the cache and the screen.
- **On logout:** clear all of these tables.

---

## 8. Tech Stack

Pinned toolchain: **Flutter 3.50.1 (stable) / Dart 3.14**, compile/target **Android SDK 36**, min SDK 24, JDK 17.

| Concern | Choice | Why |
|---|---|---|
| Backend | **Supabase** (Auth, Postgres, Storage) via `supabase_flutter` | Required |
| Local DB | **`sqflite`** + `path` | Required |
| State / DI | **Riverpod 3** (`flutter_riverpod`, `riverpod_annotation`, `riverpod_generator`) | `AsyncValue` maps directly to loading/error/data. Providers act as the seam between backend and frontend, and overrides make it easy to swap in fake repositories. |
| Routing | **`go_router`** | Login and Role redirects, `StatefulShellRoute` for the bottom nav, and deep links for the auth emails and Google login |
| Models | **`freezed`** + `json_serializable` | Immutable models that convert to and from both Supabase rows and sqflite |
| Images | `image_picker`, `cached_network_image` | |
| Formatting | `intl` | ₱ currency and dates |
| Connectivity | `connectivity_plus` | Offline banner |
| Testing | `flutter_test` + `mocktail` | |
| Secrets | `--dart-define-from-file=env.json` (git-ignored) | `SUPABASE_URL`, `SUPABASE_ANON_KEY` |

Add packages with `flutter pub add <name>` so pub picks compatible versions. For codegen, run `dart run build_runner watch -d`.

### Routes
| Path | Who |
|---|---|
| `/splash`, `/login`, `/signup`, `/forgot-password`, `/reset-password`, `/check-email` | Logged out |
| `/` (shell: Search · Profile), `/pharmacist/:id`, `/product/:id`, `/product/:id/reviews`, `/cart`, `/checkout`, `/orders`, `/orders/:id`, `/profile/*` | Customer |
| `/admin`, `/admin/products`, `/admin/products/:id`, `/admin/pharmacists`, `/admin/pharmacists/:id`, `/admin/categories`, `/admin/orders`, `/admin/orders/:id`, `/admin/customers`, `/admin/settings` | Admin |

Switching pharmacist does not clear the Cart: checkout creates one Order even when its lines come from several pharmacists.

The router listens to one `currentUserProvider` (the Supabase auth stream plus the User's Role and ban flag) and re-runs the redirect on every change.

### Project structure
```
lib/
  main.dart                  # Supabase.initialize, sqflite open, ProviderScope
  app/                       # router.dart, theme.dart                       (frontend)
  core/                      # money, order math, Tier, order status, card validation, errors
  models/                    # freezed models                                (backend)
  data/                                                                     (backend)
    repositories.dart        # the interfaces (docs/technical/modules.md)
    fake/  supabase/  local/ # adapters
    providers.dart
  features/                  # auth/ catalog/ product/ cart/ checkout/ orders/ profile/ admin/   (frontend)
supabase/
  migrations/                # schema, RLS, functions, triggers, views, storage policies   (backend)
tool/seed.dart               # loads docs/mock-data/*.csv
test/
```

---

## 9. Non-functional Requirements

| # | Constraint |
|---|---|
| NFR-1 Scale | ~20 Users, ~30 Products / ~80 Variants, a few hundred Orders. Fits Supabase's free plan. Pages of 20. |
| NFR-2 Speed | Every screen shows cached or loaded data within ~2 s on the emulator. Images are resized to ~1280 px before upload. |
| NFR-3 Correctness | Stock never goes below 0, and there's no double-selling. Money is computed in the database in `numeric`. |
| NFR-4 Security | RLS on every table. Logged-out requests see nothing. Roles and bans change only through Admin functions. No service key in the app. Only the Admin can upload images. |
| NFR-5 Data | All. No full card numbers or CVVs are stored. |
| NFR-6 Availability | Best effort. Free Supabase projects **pause after 7 days idle**, so open the dashboard in the week before the demo. |
| NFR-7 Email | The built-in sender only reaches team members. Demo with team accounts or Google, or turn off "Confirm email". |
| NFR-8 Quality | Unit tests for money math, Tier, Luhn and status transitions. Tap targets ≥ 48 dp. |

---

## 10. Milestones

Target finish: **Fri Dec 4**, leaving a buffer before the first-week-of-December deadline.

| Dates | Backend | Frontend |
|---|---|---|
| Nov 28–29 | Supabase project, schema + RLS, auth trigger, models + fake repositories | Theme, router + guards, auth screens |
| Nov 30–Dec 1 | Catalog repository, Storage, `product_cards` view, sqflite cart + cache | Home catalog, Product detail, Cart |
| Dec 2 | `place_order`, `cancel_order`, orders and reviews repositories | Checkout, My Orders, Order detail, Reviews, Profile/Addresses/Cards |
| Dec 3 | Admin product management, `set_order_status`, bans, dashboard numbers | Admin screens |
| Dec 4 | Seed data, Google login, test pass, tablet APK | Offline states, polish, demo run-through |

---

## 11. MVP vs Stretch

- **MVP:** FR-1 to FR-18.
- **Stretch (only after the MVP works):** favorites, recent searches, onboarding slides, dark mode.

## 12. Out of Scope

Third-party sellers / a marketplace, pharmacist accounts and logins, guest browsing, prescriptions, real payments and refunds, real shipping and tracking, tax, push notifications, chat, iOS and web, real drug names, coupons.

## 13. Team Split & Contract

| | **Backend** | **Frontend / design** |
|---|---|---|
| Owns | `supabase/`, `lib/models/`, `lib/data/`, seed tool | `lib/app/`, `lib/features/`, branding |
| Delivers | Schema, RLS, functions, Storage, repositories, sqflite | Screens, controllers, router guards, theme |

The full interfaces (each repository has a Fake and a Supabase adapter) are in **`docs/technical/modules.md`**. That file is the contract.
1. Backend commits models and repository signatures first, returning fake data.
2. Backend swaps in real Supabase/sqflite calls behind the same signatures.
3. A signature change is called out in the PR.

**Errors:** repositories throw `AppException` subclasses with a user-readable message. Controllers use `AsyncValue.guard`, and screens use `.when(data/loading/error)`.

**Git:** `main` plus feature branches `be/<thing>` and `fe/<thing>`. PRs are reviewed by the other person.

## 14. Mock Data

Templates are in `docs/mock-data/` (see its README). Fill them with data and keep the headers unchanged.
