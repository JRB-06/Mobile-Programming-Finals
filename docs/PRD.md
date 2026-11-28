# ReSell: Product Requirements Document

A second-hand marketplace (Craigslist/eBay-style) built with Flutter, Supabase and sqflite.
Final project for the Flutter course. All money, cards and addresses are **fake / mock**.

---

## 1. Overview & Goals

| Goal | Success measure |
|------|-----------------|
| Users can list used items and buy items from others | A customer can post a listing and another customer can buy it end-to-end |
| Secure auth with email | Sign up → confirm email → log in → session persists across app restarts |
| Role-based access | Admin-only screens and data are unreachable by customers (blocked by the DB, not just the UI) |
| Works offline for browsing | Last-loaded feed, categories, cart and drafts are available with no network |
| Realistic demo | Seeded with mock users, listings, orders and reviews from `docs/mock-data/` |

**Platform:** Android (tested on the Pixel 8 emulator, API 35). iOS/web are out of scope.

---

## 2. Roles & RBAC

Every user who signs up is a **customer**. A customer can both buy and sell, like eBay.
**Admins** are promoted manually (seed data or an existing admin).

| Capability | Guest (not logged in) | Customer | Admin |
|---|:-:|:-:|:-:|
| Browse / search / view listings | ✅ | ✅ | ✅ |
| Favorite, cart, checkout | ❌ (prompt login) | ✅ | ✅ |
| Create / edit / delete **own** listings | ❌ | ✅ | ✅ |
| Edit / hide / delete **any** listing | ❌ | ❌ | ✅ |
| View **own** orders (as buyer or seller) | ❌ | ✅ | ✅ |
| View **all** orders | ❌ | ❌ | ✅ |
| Review a seller after a completed order | ❌ | ✅ | ✅ |
| Report a listing | ❌ | ✅ | ✅ |
| Resolve reports | ❌ | ❌ | ✅ |
| Manage categories | ❌ | ❌ | ✅ |
| Ban / unban users, promote to admin | ❌ | ❌ | ✅ |
| Admin dashboard | ❌ | ❌ | ✅ |

### Enforcement (3 layers)
1. **Database: Supabase Row Level Security (RLS).** This is the real security. `profiles.role` is `'customer'` or `'admin'`. A SQL helper `is_admin()` checks it, and every table policy uses `auth.uid()` and/or `is_admin()`.
2. **Router: `go_router` redirect.** Guests go to /login for protected routes, and non-admins are bounced from `/admin/*`.
3. **UI:** admin buttons and tabs are only rendered for admins.

> Layers 2 and 3 are convenience only. A customer calling the API directly must still be refused by RLS.

Banned users (`profiles.is_banned = true`) can log in but cannot insert listings, orders or reviews (RLS check), and they see a "suspended" banner.

---

## 3. Authentication (Supabase Auth)

| Flow | Details |
|---|---|
| Sign up | Email, password (min 8, 1 number), full name. Calls `supabase.auth.signUp`. Supabase sends a **confirmation email**. A DB trigger creates the `profiles` row with role `customer`. |
| Email confirmation | User taps the link in the email. The deep link (`io.resell.app://login-callback`) opens the app and logs them in. |
| Log in | Email + password through `signInWithPassword`. Unconfirmed accounts show "Please confirm your email" plus a resend button. |
| Forgot password | `resetPasswordForEmail`. The deep link opens a "Set new password" screen. |
| Session | Persisted automatically by `supabase_flutter`. Splash checks the session and routes to Home or Login. |
| Log out | `signOut` and clear the user's sqflite tables (cart, drafts). |

"Login through the app" and "login with Supabase email" are the same Supabase Auth account, so there is one source of truth.
*Stretch:* magic-link (passwordless) login with `signInWithOtp`.

---

## 4. Screens & Features

### Public / Auth
- **Splash:** checks the session and loads the role
- **Onboarding** (first launch only, flag in sqflite or shared prefs): 3 slides
- **Login / Sign up / Forgot password / Reset password**

### Customer (bottom nav: Home · Search · Sell · Cart · Profile)
- **Home:** category chips, "Recently listed", and "Near you" (same city as the default address)
- **Search & filters:** keyword, category, price min/max, condition, city, sort (newest, price ↑↓)
- **Listing detail:** image carousel, title, price, condition badge, description, location, seller card (name, avatar, rating, member since), Add to cart, Favorite, Report
- **Sell / Edit listing:** up to 5 photos (`image_picker` → Supabase Storage bucket `listing-images`), title, description, category, condition, price, city. **Save draft** stores it locally in sqflite.
- **My listings:** tabs Active / Sold / Hidden / Drafts. Edit, mark as sold, delete.
- **Favorites**
- **Cart:** items grouped by seller, qty (usually 1 for used goods), remove, subtotal
- **Checkout:** pick address → pick card → review → **Place order** (mock payment, §7)
- **Orders:** "Purchases" and "Sales" tabs. Status flow: `pending → paid → shipped → completed` (or `cancelled`). The seller marks shipped, and the buyer marks received/completed.
- **Order detail:** items, totals, address snapshot, card last4, status timeline, "Leave review" when completed
- **Profile:** avatar, name, phone, rating. Links to Addresses, Payment methods, My reviews, Logout.
- **Addresses:** CRUD, set default
- **Payment methods:** CRUD mock cards, set default
- **Seller profile (public):** their active listings and reviews

### Admin (extra "Admin" entry in Profile, routes under `/admin`)
- **Dashboard:** totals (users, active listings, orders, revenue), orders in the last 7 days
- **Users:** search, view, ban/unban, promote/demote
- **Listings moderation:** all listings, filter by status/reported, hide/unhide/delete
- **Categories:** CRUD
- **Orders:** all orders, filter by status, change status
- **Reports:** open reports. Resolve by dismissing or hiding the listing.

---

## 5. Data Model (Supabase Postgres)

All tables have `id uuid pk default gen_random_uuid()` and `created_at timestamptz default now()` unless noted.

| Table | Key columns | Relations |
|---|---|---|
| **profiles** | `id` (= `auth.users.id`), full_name, phone, avatar_url, role (`customer`\|`admin`), is_banned bool | 1–1 auth.users |
| **addresses** | user_id, label, line1, line2, city, province, postal_code, country, is_default | → profiles |
| **payment_cards** | user_id, cardholder, brand, last4, exp_month, exp_year, is_default | → profiles |
| **categories** | name (unique), icon | |
| **listings** | seller_id, category_id, title, description, condition (`new`\|`like_new`\|`good`\|`fair`\|`poor`), price numeric(10,2), location_city, status (`active`\|`sold`\|`hidden`), updated_at | → profiles, → categories |
| **listing_images** | listing_id, url, sort_order | → listings (cascade) |
| **favorites** | user_id, listing_id (pk both) | → profiles, → listings |
| **cart_items** | user_id, listing_id, qty | → profiles, → listings |
| **orders** | buyer_id, status, subtotal, shipping_fee, total, shipping_address jsonb (snapshot), card_brand, card_last4 | → profiles |
| **order_items** | order_id, listing_id, seller_id, title_snapshot, price_snapshot, qty | → orders, → listings, → profiles |
| **reviews** | order_id, reviewer_id, seller_id, rating 1–5, comment. Unique (order_id, reviewer_id). | → orders, → profiles |
| **reports** | listing_id, reporter_id, reason, status (`open`\|`resolved`) | → listings, → profiles |

**Why snapshots?** Orders copy the address, title and price so history stays correct when the listing or address changes later.

### RLS summary
| Table | Select | Insert | Update / Delete |
|---|---|---|---|
| profiles | everyone (public fields) | trigger only | self (not `role`/`is_banned`) · admin all |
| addresses, payment_cards, favorites, cart_items | owner · admin | owner | owner |
| categories | everyone | admin | admin |
| listings | `status='active'` for everyone · owner · admin | authenticated & not banned, `seller_id = auth.uid()` | owner · admin |
| listing_images | follows listing | listing owner | listing owner · admin |
| orders | buyer · seller of any item · admin | buyer (not banned) | buyer (cancel), seller (ship), admin |
| order_items | same as order | with order | admin |
| reviews | everyone | reviewer of a **completed** order | reviewer · admin |
| reports | reporter · admin | authenticated | admin |

Storage bucket `listing-images`: public read, and authenticated users can write only to the `{auth.uid()}/...` path.

---

## 6. Local Storage (sqflite)

Supabase is the **source of truth**. sqflite is the **offline cache and local-only data**.

| Local table | Purpose |
|---|---|
| `cached_listings` | Last fetched home/search results (json + fetched_at) for offline browsing |
| `cached_categories` | Categories for offline filters |
| `local_cart` | Cart works offline and is synced to `cart_items` when online and at checkout |
| `listing_drafts` | Unfinished Sell-form data + local image paths, uploaded on "Publish" |
| `recent_searches` | Last 10 search terms |

Rules:
- Read path: show the cache instantly, fetch from Supabase, update the cache and the UI.
- With no network: show a "You're offline" banner. Checkout and posting are disabled.
- On logout: clear `local_cart`, `listing_drafts` and `recent_searches`.

---

## 7. Mock Payments

- No real gateway. Card form fields: cardholder, number, expiry, CVV.
- Validation: **Luhn check**, expiry not in the past, CVV 3–4 digits, brand detected from the prefix (4 = Visa, 51–55 = Mastercard, 34/37 = Amex).
- **Only brand + last4 + expiry are saved.** The full number and CVV are never stored, even though they're fake. This is the industry habit and part of the security grade.
- "Place order" shows a 2-second "Processing payment…" state. The order is created with status `paid`, the listings are marked `sold`, and the cart is cleared.
- Test card numbers: `4242 4242 4242 4242` (Visa), `5555 5555 5555 4444` (MC), `3782 822463 10005` (Amex). A test number `4000 0000 0000 0002` simulates a **declined** card.

---

## 8. Tech Stack

Pinned toolchain: **Flutter 3.50.1 (stable) / Dart 3.14**, compile/target **Android SDK 36**, min SDK 24.

| Concern | Choice | Why |
|---|---|---|
| Backend | **Supabase** (Auth, Postgres, Storage) via `supabase_flutter` | Required |
| Local DB | **`sqflite`** + `path` | Required |
| State management / DI | **Riverpod 3** (`flutter_riverpod` + `riverpod_annotation` + `riverpod_generator`) | `AsyncValue` maps directly to loading/error/data for every Supabase call. Providers also act as the dependency-injection layer, which gives backend and frontend a clean boundary (§14). Overrides make it easy to swap in fake repositories and to write tests. |
| Routing | **`go_router`** | Declarative routes, `redirect` for auth + role guards, `StatefulShellRoute` for the bottom nav, deep links for the Supabase email links |
| Models | **`freezed`** + `json_serializable` | Immutable models, `copyWith`, `fromJson`/`toJson` for both Supabase rows and sqflite maps |
| Images | `image_picker`, `cached_network_image` | |
| Formatting | `intl` | Currency (₱) and dates |
| Connectivity | `connectivity_plus` | Offline banner, disabling checkout |
| Forms | Flutter's built-in `Form`/`TextFormField` + shared validators in `core/validators.dart` | No extra package needed |
| Testing | `flutter_test` + `mocktail` | |
| Lints | `flutter_lints` (default) | |
| Secrets | `--dart-define-from-file=env.json` (git-ignored) for `SUPABASE_URL` / `SUPABASE_ANON_KEY` | |

Add packages with `flutter pub add <name>` (or `dev:<name>`) so pub picks versions compatible with Flutter 3.50.1. Don't hand-write version numbers.
Code generation: `dart run build_runner watch -d` while developing.

### Routing map
| Path | Screen | Guard |
|---|---|---|
| `/splash`, `/onboarding` | | none |
| `/login`, `/signup`, `/forgot-password`, `/reset-password` | auth | logged-in users go to `/` |
| `/` (shell: home · search · sell · cart · profile) | customer tabs | browsing is public. `/sell` and `/cart` need a login. |
| `/listing/:id`, `/seller/:id` | detail | none |
| `/checkout`, `/orders`, `/orders/:id`, `/profile/*` | | logged in |
| `/admin`, `/admin/users`, `/admin/listings`, `/admin/categories`, `/admin/orders`, `/admin/reports` | admin | `role == admin` |

The redirect reads one `authStateProvider` (Supabase `onAuthStateChange` stream + the user's `profiles.role`). The router uses `refreshListenable` so it re-evaluates when the user logs in or out.

## 9. Project Structure

```
lib/
  main.dart                  # Supabase.initialize, sqflite open, ProviderScope
  app/
    router.dart              # go_router + guards            (frontend)
    theme.dart                                               (frontend)
  core/                      # validators (Luhn, email), formatters, constants, errors
  models/                    # freezed models                (backend)
  data/                                                      (backend)
    supabase/                # *_repository.dart, one per area: auth, listings, orders, cart, profile, admin
    local/                   # app_database.dart (sqflite), *_dao.dart
    providers.dart           # Riverpod providers exposing the repositories
  features/                                                  (frontend)
    auth/ home/ search/ listing/ sell/ cart/ checkout/ orders/ profile/ admin/
      <feature>_screen.dart
      <feature>_controller.dart   # Riverpod Notifier/AsyncNotifier calling repositories
      widgets/
supabase/                                                    (backend)
  migrations/0001_schema.sql # tables, trigger, is_admin(), RLS, storage policies
  seed/                      # importer for docs/mock-data/*.csv
test/
```

## 10. Non-functional Requirements

- Every form validates input and shows inline errors.
- Every network screen has loading, empty, error (with retry) and offline states.
- Images are compressed before upload (max ~1280 px).
- Accessibility: tap targets ≥ 48dp, semantic labels on icon buttons, text scales.
- No secrets in git. The anon key is safe to ship *because* RLS is on, and the service-role key is **never** in the app.

## 11. Milestones

| # | Deliverable |
|---|---|
| M1 | Env setup (`docs/SETUP.md`), Flutter project, Supabase project, auth flows working |
| M2 | Schema + RLS, listings CRUD, image upload, home/search/detail |
| M3 | Favorites, cart, checkout (mock pay), orders + status flow |
| M4 | Admin screens, role guards, ban/promote, reports |
| M5 | sqflite offline cache, drafts, recent searches, polish |
| M6 | Seed mock data, test pass, demo video/screenshots |

## 12. Out of Scope

Real payments, real shipping/tracking APIs, push notifications, in-app chat (*stretch*), iOS/web builds, social login.

## 13. Mock Data

Templates are in `docs/mock-data/`. Fill them with fake data and keep the headers unchanged. See `docs/mock-data/README.md`.

## 14. Team Split & Contract

| | Owner: **Backend** | Owner: **Frontend** |
|---|---|---|
| Owns | `supabase/`, `lib/models/`, `lib/data/`, seed script | `lib/app/`, `lib/features/`, `core/` UI helpers |
| Delivers | schema + RLS, storage bucket, auth trigger, repositories, sqflite DAOs, offline sync | screens, controllers, router guards, theme, form UX |

**Contract = the models + the public methods of each repository.** This lets both of you work in parallel:
1. Week 1: backend commits `lib/models/*` and repository **signatures** first. Method bodies can return hard-coded fake data, so frontend can build screens right away.
2. Backend swaps in real Supabase/sqflite bodies behind the same signatures. Frontend changes nothing.
3. A signature change needs a heads-up to the other person, ideally in the PR description.

Example signature (the full list lives in the code, not here):
```dart
class ListingsRepository {
  Future<List<Listing>> fetchListings({ListingFilter? filter, int page = 0});
  Future<Listing> getListing(String id);
  Future<Listing> createListing(ListingDraft draft);   // uploads images
  Future<void> updateStatus(String id, ListingStatus status);
}
```

Errors: repositories throw `AppException` (from `core/errors.dart`) with a user-readable message. Controllers wrap calls in `AsyncValue.guard`, and screens use `.when(data/loading/error)`.

Git: one repo, `main` protected, feature branches `be/<thing>` and `fe/<thing>`, PRs reviewed by the other person.
