# Los Pollos Hermanos: Product Requirements Document

A multi-store online pharmacy themed after Breaking Bad, built with Flutter, Supabase and sqflite. It's a final project for the Mobile Programming course, due the **first week of December 2026**. All products, money, cards and addresses are **fictional mock data**.

Related docs:
- Screen flow and components: `ARCHITECTURE.md`
- Technical design (database functions, tables, failures): `docs/design/architecture.md`
- Terms: `docs/GLOSSARY.md`
- Decisions: `docs/adr/`
- Environment setup: `docs/SETUP.md`

---

## 1. Overview & Goals

**One sentence:** an Android app where Customers buy fictional, Breaking Bad-themed medicines from several Pharmacist-run Stores. Each product comes in purity/size Variants with their own Stock, and Admins approve Pharmacists and keep the marketplace clean.

| Goal | Success measure |
|---|---|
| Customers can buy from several Stores | Search a Store, add Variants from two Stores, check out, and see two Orders |
| Pharmacists run their own Store | Add a Product with Variants and images, receive an Order, and move it to Delivered |
| Admins control the marketplace | Approve a Pharmacist, ban a User, hide a Product, see the stats |
| Secure auth and roles | Email or Google login. A Customer calling the API directly still can't read other Users' data or edit Stock. |
| Correct Stock and money | Two Customers racing for the last unit: exactly one succeeds. Totals always equal subtotal + shipping + 2%. |
| Works offline for browsing | Cart and last-loaded Stores/Products are available without internet |

**Theme:** a chemistry-lab look, purity percentages, the Tier badges (Street / Pharma / Blue Sky), and punny Store names. Product names are fictional; no real drug names.

**Platform:** Android (Pixel 8 emulator, API 35, compile SDK 36).

---

## 2. Roles & Access

Every screen requires login. There is no guest browsing.

| Capability | Customer | Pharmacist | Admin |
|---|:-:|:-:|:-:|
| Search Stores, view Products and Reviews | Yes | Yes | Yes |
| Cart, checkout, own Orders, cancel before Shipped | Yes | No | No |
| Review a Product after its Order is Delivered | Yes | No | No |
| Manage own Addresses and Cards | Yes | No | No |
| Manage own Store, Products, Variants, Stock, images | No | Yes (once approved) | No |
| View own Store's Orders, move them Paid → Packed → Shipped → Delivered | No | Yes | No |
| See own Earnings | No | Yes | No |
| Approve / reject Pharmacist applications | No | No | Yes |
| Ban / unban Users | No | No | Yes |
| Hide / unhide any Product | No | No | Yes |
| Manage Categories, set the Shipping Fee | No | No | Yes |
| View all Orders, set any Order Status | No | No | Yes |
| Stats screen | No | No | Yes |

**How a User gets a Role:**
- **Customer:** chosen at signup, or the default for Google sign-ins.
- **Pharmacist:** chosen at signup with a Store name. The account is **pending** until an Admin approves it. A rejected applicant becomes a Customer and sees a notice. A Customer with no Orders can also apply from Profile.
- **Admin:** created only through seed data. The signup trigger refuses `admin`.

Roles are exclusive: a Pharmacist doesn't buy.

A **banned** User can log in but can't buy or sell. A banned Pharmacist's Store disappears from the app.

**Enforcement:**
1. **Supabase Row Level Security** on every table, plus `security definer` database functions for money, Stock, status and Role changes. This is the real security.
2. **`go_router` redirects:** logged-out users go to login, and each Role is kept to its own routes.
3. **UI:** each Role only sees its own navigation.

Layers 2 and 3 are UX only.

---

## 3. Authentication (Supabase Auth)

| Flow | Details |
|---|---|
| Sign up | Name, email, password (min 8 characters, 1 number), Role (Customer / Pharmacist), and a Store name for Pharmacists. Uses `supabase.auth.signUp` with that data. The `handle_new_user` trigger creates the profile and, for a Pharmacist, a pending Store. |
| Email confirmation | Supabase sends a link. The deep link `com.lospolloshermanos.app://login-callback` opens the app and logs the User in. **The built-in sender only delivers to Supabase team members** (ADR 0004). |
| Log in | Email + password (`signInWithPassword`), or **Continue with Google** (`signInWithOAuth`, which goes through the browser and comes back via the same deep link). Unconfirmed accounts see "Please confirm your email" with a resend button. |
| Forgot password | `resetPasswordForEmail`. The deep link opens a "Set new password" screen. |
| Session | Persisted by `supabase_flutter`. Splash checks the session and Role, then routes to Customer Home, Pharmacist Dashboard or Admin Page. |
| Log out | `signOut`, then clear the User's sqflite data (cart, cache). |

---

## 4. Functional Requirements

### Auth & accounts
- **FR-1** Sign up with email and password, choosing Customer or Pharmacist (Pharmacists also give a Store name). Email confirmation is required.
- **FR-2** Log in with email and password, or with Continue with Google.
- **FR-3** Forgot / reset password. The session persists. Logout clears local data.
- **FR-4** Pharmacist approval:
  - Pharmacists stay pending until an Admin approves them.
  - A rejected applicant becomes a Customer and sees a notice.
  - Banned Users can't buy or sell, and a banned Pharmacist's Store disappears.

### Customer
- **FR-5** The Home page searches **Stores by name**, and Search in the bottom nav does the same. Store cards show logo, name and rating. Inside a Store, Products can be filtered by Category and Tier and sorted by newest, price or rating.
- **FR-6** A Product page shows images, description, Store, rating, Reviews, and Variants (Purity %, Tier badge, Size, price, Stock).
- **FR-7** Cart:
  - Add a Variant to the Cart. Out-of-stock Variants can't be added, and quantity can't go above Stock.
  - The Cart holds Variants from several Stores, grouped by Store.
  - The Cart always shows current prices and works offline.
- **FR-8** Checkout:
  - Pick an Address and a Card.
  - One Order is created per Store, each showing Subtotal, Shipping Fee, Platform Fee and Order Total.
  - Stock is taken in one transaction.
  - If a Variant sold out or became unavailable, checkout fails, names that Variant, and charges nothing.
- **FR-9** My Orders, with a status timeline. Cancel an Order before it ships, which gives a full mock Refund and restores the Stock. Only whole Orders can be cancelled.
- **FR-10** Review a Product (1–5 stars + comment) from a Delivered Order Item, at most once per Order Item. The Review shows which Variant was bought.
- **FR-11** Profile:
  - Edit profile.
  - Manage Addresses (with one default).
  - Manage Cards: the number is Luhn-checked, and only brand, last 4 and expiry are saved.
  - Apply as Pharmacist (only with no Orders).

### Pharmacist
- **FR-12** Edit the Store profile: name, logo, description.
- **FR-13** Products:
  - Create and edit Products: name, description, Category, up to 5 images.
  - Add Variants (Purity, Size, price, Stock).
  - Archive Products and Variants. Never-ordered items can be deleted.
- **FR-14** Incoming Orders: move each Order one step at a time, Paid → Packed → Shipped → Delivered.
- **FR-15** Dashboard: Earnings (total Subtotal of Delivered Orders) and Order count.

### Admin
- **FR-16** Approve or reject pending Pharmacists. Ban or unban Users.
- **FR-17** Hide or unhide any Product. Manage Categories. Set the Shipping Fee (new Orders only).
- **FR-18** View all Orders, filter them by status, and set any Order Status.
- **FR-19** Stats: Platform Revenue, GMV, Order count, pending Pharmacists.

### Offline
- **FR-20** With no internet, show the cached Stores, Products and Categories, and the Cart, under an offline banner. Checkout and all editing are disabled.

---

## 5. Money & Stock Rules

| Rule | Value |
|---|---|
| Currency | Philippine peso (₱), 2 decimals. No VAT or other tax. |
| Shipping Fee | Flat **₱50 per Order** (that is, per Store), changeable by an Admin for future Orders |
| Platform Fee | **2% of the Order's Subtotal**, rounded to the centavo, paid by the Customer as its own line |
| Order Total | Subtotal + Shipping Fee + Platform Fee |
| Where it's computed | Only in the database (`place_order`). The app sends Variant ids + quantities, never prices (ADR 0001). |
| Stock | Decremented in the same transaction as the Order. Can never go below 0. Restored on cancel. |
| Price changes | The Cart shows current prices. Order Items keep the price paid (ADR 0003). |
| Refund | A cancelled Order is refunded in full (mock) and doesn't count toward Earnings, Platform Revenue or GMV |
| Earnings / Platform Revenue | Counted from **Delivered** Orders only |

Example Order:
```
Subtotal (Gray Matter Pharmacy)   ₱630.00
Shipping                           ₱50.00
Platform fee (2%)                  ₱12.60
Total                             ₱692.60
```

**Mock cards:**
- Test numbers: `4242 4242 4242 4242` (Visa), `5555 5555 5555 4444` (Mastercard), `3782 822463 10005` (Amex). The number `4000 0000 0000 0002` simulates a **declined** card: a saved Card ending in `0002` is declined by `place_order`.
- Validation: Luhn check, expiry not in the past, CVV 3–4 digits. The CVV is never stored.
- Checkout shows a ~2-second "Processing payment…" state.

---

## 6. Screens

The flow is in `ARCHITECTURE.md` §2.

**UI design: To be decided.** The visual direction, theme and screen layouts are owned by the frontend partner and will be recorded in `DESIGN.md` once decided.

| Role | Screens |
|---|---|
| All | Splash, Login, Sign up, Forgot password, Reset password, Pending approval / Application declined notice |
| Customer | Top bar: logo, Cart. Bottom nav: Search, Profile. Home (Store search), Store page (Products + filters), Product detail, Cart, Checkout, Order success, My Orders, Order detail, Write review, Profile, Edit profile, Addresses, Cards, Apply as Pharmacist |
| Pharmacist | Dashboard (Earnings), My Products, Edit Product + Variants, Incoming Orders, Order detail, Store profile |
| Admin | Stats, Applications, Users, Products, Categories, Orders, Settings (Shipping Fee) |

Every screen that loads data has loading, empty, error (with retry) and offline states.

---

## 7. Local Storage (sqflite)

Supabase is the **source of truth**. sqflite holds **local-only data and an offline cache**.

| Local table | Purpose |
|---|---|
| `cart_items` | The Cart. There's no server copy: it's sent to `place_order` at checkout. |
| `cached_stores` | Last-loaded Store list, for offline browsing |
| `cached_product_cards` | Last-loaded Products per Store |
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
| `/splash`, `/login`, `/signup`, `/forgot-password`, `/reset-password` | Logged out |
| `/pending` | Pharmacist awaiting approval |
| `/` (shell: Search · Profile), `/store/:id`, `/product/:id`, `/cart`, `/checkout`, `/orders`, `/orders/:id`, `/profile/*` | Customer |
| `/pharmacist`, `/pharmacist/products`, `/pharmacist/products/:id`, `/pharmacist/orders`, `/pharmacist/store` | Approved Pharmacist |
| `/admin`, `/admin/applications`, `/admin/users`, `/admin/products`, `/admin/categories`, `/admin/orders`, `/admin/settings` | Admin |

The router listens to one `authStateProvider`: the Supabase auth stream plus the User's profile (Role, banned, Store status). It re-runs the redirect on every change.

### Project structure
```
lib/
  main.dart                  # Supabase.initialize, sqflite open, ProviderScope
  app/                       # router.dart, theme.dart                       (frontend)
  core/                      # validators (Luhn, email), money formatting, Tier, errors
  models/                    # freezed models                                (backend)
  data/                                                                     (backend)
    supabase/                # auth, stores, products, cart/checkout, orders, reviews, profile, admin repositories
    local/                   # app_database.dart, DAOs
    providers.dart           # Riverpod providers exposing the repositories
  features/                  # auth/ home/ store/ product/ cart/ checkout/ orders/   (frontend)
                             # profile/ pharmacist/ admin/
supabase/
  migrations/                # schema, RLS, functions, triggers, views, storage policies   (backend)
  seed/                      # loads docs/mock-data/*.csv
test/
```

---

## 9. Non-functional Requirements

| # | Constraint |
|---|---|
| NFR-1 Scale | ~20 Users, 5–8 Stores, ~50 Products / ~150 Variants, a few hundred Orders. Fits Supabase's free plan. Pages of 20. |
| NFR-2 Speed | Every screen shows cached or loaded data within ~2 s on the emulator. Images are resized to ~1280 px before upload. |
| NFR-3 Correctness | Stock never goes below 0, and there's no double-selling. Money is computed in the database in `numeric`. |
| NFR-4 Security | RLS on every table. Logged-out requests see nothing. Role, ban and approval status change only through Admin functions. No service key in the app. Storage uploads only to the owner's folder. |
| NFR-5 Data | All fictional. No full card numbers or CVVs are stored. |
| NFR-6 Availability | Best effort. Free Supabase projects **pause after 7 days idle**, so open the dashboard in the week before the demo. |
| NFR-7 Email | The built-in sender only reaches team members. Demo with team accounts or Google, or turn off "Confirm email". |
| NFR-8 Quality | Unit tests for money math, Tier, Luhn and status transitions. Tap targets ≥ 48 dp. |

---

## 10. Milestones

Target finish: **Fri Dec 4**, leaving a buffer before the first-week-of-December deadline.

| Dates | Backend | Frontend |
|---|---|---|
| Nov 28–29 | Supabase project, schema + RLS, auth trigger, models + repository signatures with fake data | Theme, router + guards, auth screens |
| Nov 30–Dec 1 | Stores/products repositories, Storage, `product_cards` view, sqflite cart + cache | Home/Search, Store page, Product detail, Cart |
| Dec 2 | `place_order`, `cancel_order`, orders and reviews repositories | Checkout, My Orders, Order detail, Reviews, Profile/Addresses/Cards |
| Dec 3 | `set_order_status`, admin functions, stats, earnings | Pharmacist screens, Admin screens |
| Dec 4 | Seed data, Google login, test pass | Offline states, polish, demo run-through |

---

## 11. MVP vs Stretch

- **MVP:** FR-1 to FR-20.
- **Stretch (only after the MVP works):** favorites, recent searches, onboarding slides, low-stock alerts, product drafts, dark mode.

## 12. Out of Scope

Guest browsing, prescriptions, real payments and refunds, real shipping and tracking, tax, push notifications, chat, iOS and web, more than one Store per Pharmacist, a shared catalog across Stores, cross-store product search, real drug names, coupons, and payouts to Pharmacists.

## 13. Team Split & Contract

| | **Backend** | **Frontend / design** |
|---|---|---|
| Owns | `supabase/`, `lib/models/`, `lib/data/`, seed script | `lib/app/`, `lib/features/`, branding |
| Delivers | Schema, RLS, functions, Storage, repositories, sqflite | Screens, controllers, router guards, theme |

**The contract is the models plus the public methods of each repository.**
1. Backend commits models and repository signatures first, returning fake data.
2. Backend swaps in real Supabase/sqflite calls behind the same signatures.
3. A signature change is called out in the PR.

The full interfaces (7 repositories plus 4 pure `core/` modules, each with a Fake and a Supabase adapter) are in **`docs/design/modules.md`**. That file is the contract.

**Errors:** repositories throw `AppException` subclasses with a user-readable message. Controllers use `AsyncValue.guard`, and screens use `.when(data/loading/error)`.

**Git:** `main` plus feature branches `be/<thing>` and `fe/<thing>`. PRs are reviewed by the other person.

## 14. Mock Data

Templates are in `docs/mock-data/` (see its README). Fill them with fictional data and keep the headers unchanged.
