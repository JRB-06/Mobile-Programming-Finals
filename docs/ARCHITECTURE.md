# Architecture

More detail: `docs/technical/architecture.md` (database functions, tables, failure handling) and `docs/technical/architecture.html` (diagram). Requirements: `docs/PRD.md`. Terms: `docs/GLOSSARY.md`.

## 1. Overview

### Los Pollos Hermanos
A Pharmaceutical E-commerce app.

Customers buy fictional medicines from several **Stores**, each run by a **Pharmacist**. Each product comes in **Variants** (purity % + size), and each Variant has its own price and stock. Admins approve pharmacists and moderate the marketplace. It's a Flutter Android app on Supabase (auth, database, image storage), with sqflite on the phone for the cart and offline browsing.

Roles: **Customer**, **Pharmacist**, **Admin**. Every screen requires login. There is no guest browsing.

## 2. Pipeline

### Customer
```
[Stage 1] → [Stage 2] → [Stage 3] [Cart] → [Stage 4] → [Stage 5] → [Stage 1]
      |
      ├── [Pharmacist Dashboard]
      └── [Admin Page]
```

**`App components`**
- (Top Navigation): Logo, cart
- (Bottom Navigation): Search, Profile

1. **`Authentication`**
   Email + password, or Continue with Google. The login credentials determine whether the user is a customer, pharmacist or admin.
   → Stage 2 || Pharmacist Dashboard || Admin Page
   - Signup asks for name, email, password and role (Customer or Pharmacist). A Pharmacist also gives a store name and waits for admin approval.
   - Supabase sends a confirmation email. Forgot-password sends a reset link. The session persists across app restarts.
   - Google sign-ins start as Customers and can apply to become a Pharmacist from Profile.

2. **`HomePage`**
   A page where the user selects/searches the desired pharmacist directly.
   Pharmacist input → Stage 3
   - Search matches store names. Each store card shows logo, name and rating (the average of its product reviews).
   - Only approved stores whose pharmacist isn't banned are listed.

3. **`Pharmacist products`**
   Displays the products of the selected pharmacist, where the user can add to cart.
   add to cart →
   - Products can be filtered by category and purity tier inside the store.
   - A product page lists its variants with a **Tier** badge (Street < 80%, Pharma 80–98.9%, Blue Sky ≥ 99%), size, price and stock, plus its reviews.
   - Out-of-stock variants can't be added, and quantity can't go above stock.

4. **`Add to cart`**
   Displays the items in cart for checkout.
   checkout → Stage 5
   - The cart can hold items from several stores, grouped by store.
   - It's saved on the phone (sqflite), so it survives restarts and works offline.

5. **`checkout`**
   Contains checkout details.
   complete order, shipping details, payment → Stage 1
   - Pick a saved address and a mock card. Cards are Luhn-checked, and only brand + last 4 are stored.
   - One checkout creates **one order per store**: subtotal + **₱50 shipping** + **2% platform fee** = total.
   - Totals and stock are computed inside the database (`place_order`), so prices can't be faked and the last unit can't be sold twice.

**`Profile Page`**
Contains profile details.
Edit profile → New profile details
- Also holds **My Orders**:
  - Status: paid → packed → shipped → delivered.
  - Cancel any time before shipped.
  - Review a product once its order is delivered.
- Saved **Addresses**, saved **Cards**, Logout.

### Pharmacist
```
[Authentication] → [Pharmacist Dashboard] → [My Products] ⇄ [Edit Product + Variants]
                            └→ [Incoming Orders] → packed → shipped → delivered
```
- **Dashboard:** earnings (subtotal of delivered orders) and order count.
- **My Products:** add, edit and archive products. Each has up to 5 images, a category, and variants (purity, size, price, stock).
- A new pharmacist sees "Waiting for admin approval" until approved. A rejected applicant becomes a Customer.

**`Admin Page`**
- **Pharmacist applications:** approve or reject.
- **Users:** ban / unban. Banning a pharmacist removes their store from the app.
- **Products:** hide / unhide any product.
- **Categories:** add, edit, remove.
- **Orders:** view all orders and change any status.
- **Shipping fee:** set it (applies to new orders only).
- **Stats:** platform revenue (2% fees from delivered orders), GMV, order count, pending pharmacists.

## 3. Components

`[Mobile app]` | Flutter 3.50 (Android)

| Layer | Folder | Owner | What it does |
|---|---|---|---|
| Screens | `lib/features/` | Frontend | The pages above + theme/design |
| Router | `lib/app/router.dart` | Frontend | `go_router`. Logged-out users go to login, and each role goes to its own pages. These are UX guards only; real security is in the database. |
| State | `lib/features/*/…_controller.dart` | Frontend | Riverpod. Every load shows loading / error / data. |
| Repositories | `lib/data/` | Backend | The only code that talks to Supabase or sqflite. **Their method signatures + `lib/models/` are the contract between us.** |
| Local DB | `lib/data/local/` | Backend | sqflite: cart, cached stores/products/categories for offline browsing |

`[Database]` | Supabase

| Piece | What it does |
|---|---|
| Auth | Email + password (the built-in email sender only reaches Supabase team members) and Google sign-in |
| Postgres | All tables, with **row-level security on every table**. Customers see only their own orders, addresses and cards; pharmacists only their own store's data; admins everything. Logged-out requests see nothing. |
| Database functions | `place_order`, `cancel_order`, `set_order_status`, admin actions: anything touching money, stock, order status or roles |
| Storage | Product images and store logos (public by URL, since they're fictional photos; only the store's owner can upload) |

```
Phone: Screens → Riverpod → Repositories → sqflite (cart, cache)
                                         → Supabase (Auth · tables + RLS · functions · Storage)
```

## 4. How we split the work
1. Backend commits `lib/models/` and the repository method signatures first, returning fake data, so screens can be built immediately.
2. Backend replaces the fake data with real Supabase/sqflite calls behind the same signatures. Screens don't change.
3. Any signature change gets called out in the PR.
