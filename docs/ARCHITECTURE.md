# Architecture

More detail: `docs/technical/architecture.md` (database functions, tables, failure handling) and `docs/technical/architecture.html` (diagram). Requirements: `docs/PRD.md`. Terms: `docs/GLOSSARY.md`.

## 1. Overview

### Los Pollos Hermanos
A Pharmaceutical E-commerce app.

This is Los Pollos Hermanos' own online pharmacy, a **closed market**: one seller and no third-party stores. Customers buy medicines. Each Product comes in **Variants** (purity % + size), and each Variant has its own price and stock. The **Admin** is the owner of Los Pollos Hermanos: they run the catalog, stock and orders. It's a Flutter Android app on Supabase (auth, database, image storage), with sqflite on the phone for the cart and offline browsing.

Roles: **Customer** and **Admin**. Every screen requires login. There is no guest browsing.

## 2. Pipeline

### Customer
```
[Stage 1] → [Stage 2] → [Stage 3] [Cart] → [Stage 4] → [Stage 5] → [Stage 1]
      |
[Admin Page]
```

**`App components`**
- (Top Navigation): Logo, cart
- (Bottom Navigation): Search, Profile

1. **`Authentication`**
   Email + password, or Continue with Google. The login credentials determine whether the user is a customer or the admin.
   → Stage 2 || Admin Page
   - Signup asks for name, email and password. Every new account is a Customer.
   - Supabase sends a confirmation email. Forgot-password sends a reset link. The session persists across app restarts.

2. **`HomePage`**
   A page where the user browses/searches the medicines.
   Product input → Stage 3
   - Search by product name, filter by category and purity **Tier**, sort by newest, price or rating.
   - Each product card shows image, name, price range, best Tier and rating.

3. **`Products`**
   Displays the selected product, where the user can add to cart.
   add to cart →
   - The product page lists its variants with a **Tier** badge (Street < 80%, Pharma 80–98.9%, Blue Sky ≥ 99%), size, price and stock, plus its reviews.
   - Out-of-stock variants can't be added, and quantity can't go above stock.

4. **`Add to cart`**
   Displays the items in cart for checkout.
   checkout → Stage 5
   - Saved on the phone (sqflite), so it survives restarts and works offline.

5. **`checkout`**
   Contains checkout details.
   complete order, shipping details, payment → Stage 1
   - Pick a saved address and a mock card. Cards are Luhn-checked, and only brand + last 4 are stored.
   - Order total = subtotal + **₱50 shipping**.
   - Totals and stock are computed inside the database (`place_order`), so prices can't be faked and the last unit can't be sold twice.

**`Profile Page`**
Contains profile details.
Edit profile → New profile details
- Also holds **My Orders**:
  - Status: paid → packed → shipped → delivered.
  - Cancel any time before shipped.
  - Review a product once its order is delivered.
- Saved **Addresses**, saved **Cards**, Logout.

**`Admin Page`** (the owner)
- **Dashboard:** revenue (delivered orders), order count, customer count, low-stock variants.
- **Products:** add, edit and archive products. Each has up to 5 images, a category, and variants (purity, size, price, stock).
- **Categories:** add, edit, remove.
- **Orders:** all orders. Move each one paid → packed → shipped → delivered, or cancel it before delivery.
- **Customers:** ban / unban.
- **Settings:** shipping fee (applies to new orders only).

## 3. Components

`[Mobile app]` | Flutter 3.50 (Android)

| Layer | Folder | Owner | What it does |
|---|---|---|---|
| Screens | `lib/features/` | Frontend | The pages above + theme/design |
| Router | `lib/app/router.dart` | Frontend | `go_router`. Logged-out users go to login, customers to Home, the admin to the Admin Page. These are UX guards only; real security is in the database. |
| State | `lib/features/*/…_controller.dart` | Frontend | Riverpod. Every load shows loading / error / data. |
| Repositories | `lib/data/` | Backend | The only code that talks to Supabase or sqflite. **`docs/technical/modules.md` is the contract between us.** |
| Local DB | `lib/data/local/` | Backend | sqflite: the cart, and cached products/categories for offline browsing |

`[Database]` | Supabase

| Piece | What it does |
|---|---|
| Auth | Email + password (the built-in email sender only reaches Supabase team members) and Google sign-in |
| Postgres | All tables, with **row-level security on every table**. Customers see the catalog plus their own orders, addresses and cards. The admin sees and manages everything. Logged-out requests see nothing. |
| Database functions | `place_order`, `cancel_order`, `set_order_status`, admin actions: anything touching money, stock, order status or bans |
| Storage | Product images (public by URL, since they're photos; only the admin can upload) |

```
Phone: Screens → Riverpod → Repositories → sqflite (cart, cache)
                                         → Supabase (Auth · tables + RLS · functions · Storage)
```

## 4. How we split the work
1. Backend commits `lib/models/` and the repository method signatures first, returning fake data, so screens can be built immediately.
2. Backend replaces the fake data with real Supabase/sqflite calls behind the same signatures. Screens don't change.
3. Any signature change gets called out in the PR.
