# Screens

Each screen lists:
- **Purpose:** what it's for.
- **Shows:** the content, with example data from `docs/mock-data/`.
- **Actions:** what the user can do.
- **States:** which loading / empty / error / offline variants to draw.
- **Rules:** behavior the design must allow for.

The layout is yours. Ids (A-, C-, P-, M-) match navigation.md; use them as Figma frame names.

"Standard states" means the shared **Loading**, **Empty**, **Error (with Retry)** and **Offline** components from components.md.

---

## Auth (A)

### A-01 Login
- **Purpose:** get into the app.
- **Shows:** logo, app name, email field, password field (with show/hide), "Forgot password?" link, **Log in** button, divider, **Continue with Google** button, "No account? Sign up" link.
- **Actions:** log in, Google, go to Sign up, go to Forgot password.
- **States:** button loading; inline error "Wrong email or password"; "Please confirm your email" with a **Resend email** link; offline (button disabled + banner).

### A-02 Sign up
- **Purpose:** create an account.
- **Shows:**
  - Full name, email, password (with a rule hint: "8+ characters, at least 1 number"), confirm password.
  - A **role choice**: **Customer** ("Buy from stores") or **Pharmacist** ("Run your own store").
  - When Pharmacist is chosen, an extra **Store name** field appears, plus a note: "An admin reviews new pharmacists before your store goes live."
  - **Create account** button, Google button, "Have an account? Log in".
- **Rules:**
  - Validation errors appear under each field.
  - "Email already in use" appears under the email field.
  - Google sign-up skips the role choice; those users become Customers and can apply later (C-17).
- **Next:** A-05 Check your email.

### A-03 Forgot password
- **Shows:** email field, **Send reset link** button. After sending: "If that email has an account, a reset link is on its way."

### A-04 Set new password
- **Purpose:** reached from the email link.
- **Shows:** new password, confirm, **Save** button. Success leads to Login with "Password updated".

### A-05 Check your email
- **Shows:** illustration/icon, "We sent a confirmation link to **jesse@lospollos.test**", **Resend email**, **Back to login**.
- **Note:** during the demo, emails only reach team members, so this screen must not be a dead end.

### A-06 Waiting for approval (pending Pharmacist)
- **Shows:** Store name ("Gray Matter Pharmacy"), "Your application is being reviewed by an admin", **Refresh**, **Log out**.
- **Variant:** **Application declined**: "Your pharmacist application was declined. You can still shop as a customer." with a **Continue** button, which goes to C-01.

### Splash
- **Shows:** logo only while the session is checked (under a second). No interaction.

---

## Customer (C)

### C-01 Home (Search stores)
- **Purpose:** find a Store. This is the first screen after login and the "Search" tab.
- **Shows:**
  - Top bar with logo and Cart (badge "3").
  - **Search field** ("Search pharmacists").
  - A list of **Store cards** (component): logo, name, rating ★ 4.6 (18), short description.
- **Actions:** type to search (results update as you type), tap a Store to open C-02.
- **States:**
  - Standard states.
  - Empty search: "No pharmacists match "walter"".
  - Offline: shows the last loaded list under the offline banner.
- **Rules:** only approved, active Stores appear. The list pages in 20 at a time with infinite scroll.

### C-02 Store page
- **Purpose:** see one Store's Products.
- **Shows:**
  - Store header: logo, name, rating, description.
  - **Filters:** Category chips (All · Cough & Cold · Pain Relief · Vitamins), Tier chips (All · Street · Pharma · Blue Sky).
  - **Sort:** Newest, Price low→high, Price high→low, Top rated.
  - A grid or list of **Product cards** (component).
- **Actions:** filter, sort, tap a Product to open C-03.
- **States:**
  - Standard states.
  - Empty: "No products match these filters" with a **Clear filters** button.
  - A Store with no Products at all: "This store has no products yet."

### C-03 Product page
- **Purpose:** choose a Variant and add it to the Cart.
- **Shows:**
  - Image carousel (1–5 images, with dots).
  - Name "Blue Sky Cough Relief", Store link "Gray Matter Pharmacy", rating ★ 4.8 (12), Category, description.
  - A **Variant selector**: one row or option per Variant, showing **Tier badge + purity "99.1%"**, size "100ml", price "₱450.00", and stock ("30 in stock", "Only 3 left", or "Out of stock").
  - Quantity stepper (1 up to the stock), **Add to cart** button.
  - **Reviews** section: average, count, and the 3 latest **Review tiles** with "See all reviews".
- **Actions:** pick a Variant, change quantity, add to cart (confirmation: snackbar "Added to cart · View cart"), open all reviews, tap the Store.
- **Rules:**
  - An out-of-stock Variant is visible but not selectable.
  - The quantity can't go above stock.
  - When every Variant is out of stock, the button reads "Out of stock" and is disabled.
- **States:** loading, error, offline (cached; Add to cart still works offline).

### C-03b All reviews
- **Shows:** a list of Review tiles (name, stars, date, "Bought: 99.1% · 100ml", comment). Standard states. Empty: "No reviews yet."

### C-04 Cart
- **Purpose:** review items before paying.
- **Shows:**
  - Items **grouped by Store**. Each group has a Store name header, its **Cart lines** (image, product name, Tier + purity + size, unit price, quantity stepper, remove), and its own **Price summary**: subtotal, shipping ₱50.00, platform fee (2%), Store total.
  - At the bottom: **grand total** across Stores, "Paid together", and the **Checkout** button.
- **Line problems** (each shown on the line):
  - "Out of stock": the line is excluded from the total.
  - "Only 2 left, quantity updated".
  - "No longer available": a **Remove** action is offered.
- **Rules:**
  - Checkout is disabled while any line has a problem, or while offline.
  - The cart is saved on the phone and survives restarts.
- **States:** Empty: "Your cart is empty" with a **Find a pharmacist** button. Offline: the banner, with Checkout disabled.

### C-05 Checkout
- **Purpose:** pay.
- **Shows:**
  - **Deliver to:** the selected Address card, with **Change** opening a picker that has "Add new".
  - **Pay with:** the selected Card tile (VISA •••• 4242, 12/29), with **Change** opening a picker that has "Add new".
  - **Order summary per Store**: lines and the Price summary.
  - **Grand total**.
  - Note: "Your order is split into 2 orders, one per store."
  - **Place order** button.
- **States:**
  - **Processing:** "Processing payment…" for about 2 seconds, blocking interaction.
  - **Errors** (shown as a dialog or banner, then back to the Cart for stock problems):
    - Sold out: "Blue Sky Cough Relief · 99.1% · 100ml just sold out. We've updated your cart."
    - Declined: "Your card was declined. Try another card."
    - Connection lost: "We couldn't confirm your order. **Retry**". A retry is safe and never charges twice.
  - No address or card saved yet: replace the section with "Add an address" / "Add a card".

### C-06 Order placed
- **Shows:** success illustration, "Order placed!", the orders created ("2 orders from 2 stores"), total paid ₱1,069.00, plus **View my orders** and **Keep shopping** buttons.

### C-07 Profile
- **Shows:** avatar, name, email, then menu rows: Edit profile, My Orders, Addresses, Cards, Apply as pharmacist (hidden once the user has orders), Log out.
- **Banner** when banned: "Your account is suspended. You can browse but not buy."

### C-08 Edit profile
- **Shows:** avatar (tap to change photo), full name, phone. Email is read-only. **Save**.

### C-09 My Orders
- **Shows:**
  - Filter chips: All · Paid · Packed · Shipped · Delivered · Cancelled.
  - A list of **Order rows**: Store name, date "Nov 25, 2026", item count, total ₱692.60, **Status chip**.
- **States:** Standard states. Empty: "No orders yet" with a **Find a pharmacist** button.

### C-10 Order detail
- **Shows:**
  - Store, order number (short id), date.
  - **Status timeline** (Paid → Packed → Shipped → Delivered, or the Cancelled state).
  - Items (with Tier + purity + size, quantity, price paid).
  - Price summary.
  - Shipped-to address and paid-with card (••••4242).
- **Actions:**
  - **Cancel order**, while Paid or Packed. A confirm dialog says: "Cancel this order? You'll get a full refund of ₱692.60."
  - **Write review** on each item once Delivered. It reads "Reviewed ★5" once done.
- **Note:** the Admin reuses this screen with a **Set status** action (M-06).

### C-11 Write review
- **Shows:** product name + variant bought, star picker 1–5 (required), comment (optional), **Submit**. Success: "Thanks for your review".

### C-12 Addresses / C-13 Add or edit address
- **C-12 shows:** a list of **Address cards** (label "Home", lines, city, "Default" tag), with Edit and Delete on each, and an **Add address** button.
- **C-13 shows:** label, line 1, line 2, city, province, postal code, country (default Philippines), a "Set as default" switch, **Save**.
- **States:** empty ("No saved addresses").

### C-15 Cards / C-16 Add card
- **C-15 shows:** a list of **Card tiles** (brand logo, •••• 4242, expiry, "Default"), with Delete and "Make default".
- **C-16 shows:**
  - Fields: cardholder name, card number (auto-spaced, with the brand logo appearing as you type), expiry MM/YY, CVV.
  - Note: "Mock payments only. Only the last 4 digits are saved."
  - **Save card** button.
- **Errors:** "Card number is invalid", "Card has expired", "CVV must be 3–4 digits".

### C-17 Apply as pharmacist
- **Shows:** an explanation ("Run your own store. An admin reviews your application."), a Store name field, and a **Submit application** button. On submit, the user goes to A-06.

---

## Pharmacist (P)

### P-01 Dashboard
- **Shows:**
  - Store name and logo.
  - **Earnings** ₱12,450.00 ("from 18 delivered orders").
  - Counts by status (Paid 3 · Packed 1 · Shipped 2).
  - Recent orders list (Order rows).
  - Shortcuts: **Add product** and **View orders**.
- **States:** loading, error. A new Store sees "No orders yet. Add your first product".

### P-02 My Products
- **Shows:**
  - Search, plus a "Show archived" toggle.
  - A list of **Managed product rows**: image, name, number of variants, total stock, a low-stock hint ("1 variant out of stock"), and a status tag: Active, Archived, or **Hidden by admin**.
  - An **Add product** button (FAB).
- **States:** Standard states. Empty: "No products yet" with an **Add product** button.

### P-03 Product editor
- **Purpose:** create or edit a Product.
- **Shows:**
  - **Images:** up to 5, reorderable, with add and remove.
  - **Details:** name, description, Category (dropdown).
  - **Variants list:** each row has purity % (with a live Tier badge preview), size label, price ₱, stock, and remove. Plus an **Add variant** button.
  - **Save** button.
  - **Archive product** and **Delete product** (destructive), shown when editing.
- **Rules:**
  - At least 1 Variant is required.
  - Purity is 0–100 with one decimal. Price is above 0. Stock is 0 or more.
  - Delete is only possible if the product was never ordered. Otherwise show "This product has orders. Archive it instead."
  - A product hidden by an admin shows a locked banner: "Hidden by admin".
- **States:**
  - Saving.
  - "Saved, but 1 image failed to upload. **Retry**".
  - Validation errors on each field.
  - Unsaved-changes confirmation on back.

### P-04 Incoming Orders
- **Shows:** status filter chips (Paid by default) and Order rows (customer first name, date, items, Store subtotal, Status chip).
- **States:** Standard states. Empty: "No paid orders right now."

### P-05 Order detail (pharmacist)
- **Shows:** same content as C-10 (items, ship-to address, timeline), but **without** the customer's card.
- **Action:** one primary button that moves the order forward: **Mark as packed**, then **Mark as shipped**, then **Mark as delivered**. It's hidden once Delivered or Cancelled.

### P-06 Store profile
- **Shows:** logo (change), Store name, description, **Save**, and **Log out**.

---

## Admin (M)

### M-01 Stats
- **Shows:** four stat tiles:
  - **Platform revenue** ₱1,240.60 (2% fees, delivered orders)
  - **GMV** ₱64,210.00
  - **Orders** 128
  - **Pending pharmacists** 3, which taps through to M-02

  Plus links to **Categories** and **Settings**.

### M-02 Applications / M-03 Application detail
- **M-02 shows:** a list of pending Stores (Store name, applicant name, email, applied date).
- **M-03 shows:** the details, with **Approve** and **Reject** buttons. Reject asks for confirmation: "The user will become a customer."
- **States:** empty ("No pending applications").

### M-04 Users
- **Shows:** search, and a list of User rows (avatar, name, email, role tag, "Banned" tag). Each row has **Ban** / **Unban**, with confirmation.
- **Note:** banning a Pharmacist warns "Their store and products will be hidden from customers."

### M-05 Products
- **Shows:** search and a "Hidden only" toggle. Product rows show image, name, Store, and a **Hide** / **Unhide** toggle.

### M-06 Orders
- **Shows:** status filter and Order rows (Store, customer, total, status). Tapping one opens the C-10 layout with a **Set status** picker (any status) and **Cancel order**.

### M-07 Categories / M-08 Add or edit category
- **M-07 shows:** a list (icon, name, product count), with Edit and Delete. Delete is blocked when products use the category: "Move or archive its 6 products first."
- **M-08 shows:** name and an icon picker (Material icons).

### M-09 Settings
- **Shows:** **Shipping fee per order** ₱50.00 (editable), with the note "Applies to new orders only". Also a **Log out** button.
