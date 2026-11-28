# Screens

Each screen lists:
- **Purpose:** what it's for.
- **Shows:** the content, with example data from `docs/mock-data/`.
- **Actions:** what the user can do.
- **States:** which loading / empty / error / offline variants to draw.
- **Rules:** behavior the design must allow for.

The layout is yours. Ids (A-, C-, M-) match navigation.md; use them as Figma frame names.

"Standard states" means the shared **Loading**, **Empty**, **Error (with Retry)** and **Offline** components from components.md.

---

## Auth (A)

### A-01 Login
- **Purpose:** get into the app.
- **Shows:** logo, app name, email field, password field (with show/hide), "Forgot password?" link, **Log in** button, divider, **Continue with Google** button, "No account? Sign up" link.
- **Actions:** log in, Google, go to Sign up, go to Forgot password.
- **States:** button loading; inline error "Wrong email or password"; "Please confirm your email" with a **Resend email** link; offline (button disabled + banner).

### A-02 Sign up
- **Purpose:** create a Customer account.
- **Shows:** full name, email, password (with a rule hint: "8+ characters, at least 1 number"), confirm password, **Create account** button, Google button, "Have an account? Log in".
- **Rules:** validation errors appear under each field. "Email already in use" appears under the email field. There's no role choice: everyone who signs up is a Customer.
- **Next:** A-05 Check your email.

### A-03 Forgot password
- **Shows:** email field, **Send reset link** button. After sending: "If that email has an account, a reset link is on its way."

### A-04 Set new password
- **Purpose:** reached from the email link.
- **Shows:** new password, confirm, **Save** button. Success leads to Login with "Password updated".

### A-05 Check your email
- **Shows:** illustration/icon, "We sent a confirmation link to **jesse@lospollos.test**", **Resend email**, **Back to login**.
- **Note:** during the demo, emails only reach team members, so this screen must not be a dead end.

### Splash
- **Shows:** logo only while the session is checked (under a second). No interaction.

---

## Customer (C)

### C-01 Home (catalog)
- **Purpose:** find a medicine. This is the first screen after login and the "Search" tab.
- **Shows:**
  - Top bar with logo and Cart (badge "3").
  - **Search field** ("Search medicines").
  - **Filters:** Category chips (All · Cough & Cold · Pain Relief · Vitamins) and Tier chips (All · Street · Pharma · Blue Sky).
  - **Sort:** Newest, Price low→high, Price high→low, Top rated.
  - A grid of **Product cards** (component).
- **Actions:** search (results update as you type), filter, sort, tap a Product to open C-02.
- **States:**
  - Standard states.
  - Empty search: "No medicines match "blue"" with a **Clear filters** button.
  - Offline: shows the last loaded results under the offline banner.
- **Rules:** archived Products never appear. The grid pages in 20 at a time with infinite scroll. It should go to more columns on the tablet.

### C-02 Product page
- **Purpose:** choose a Variant and add it to the Cart.
- **Shows:**
  - Image carousel (1–5 images, with dots).
  - Name "Blue Sky Cough Relief", rating ★ 4.8 (12), Category, description.
  - A **Variant selector**: one option per Variant, showing **Tier badge + purity "99.1%"**, size "100ml", price "₱450.00", and stock ("30 in stock", "Only 3 left", or "Out of stock").
  - Quantity stepper (1 up to the stock), **Add to cart** button.
  - **Reviews** section: average, count, and the 3 latest **Review tiles** with "See all reviews".
- **Actions:** pick a Variant, change quantity, add to cart (confirmation: snackbar "Added to cart · View cart"), open all reviews.
- **Rules:**
  - An out-of-stock Variant is visible but not selectable.
  - The quantity can't go above stock.
  - When every Variant is out of stock, the button reads "Out of stock" and is disabled.
- **States:** loading, error, offline (cached; Add to cart still works offline).

### C-03 All reviews
- **Shows:** a list of Review tiles (name, stars, date, "Bought: 99.1% · 100ml", comment). Standard states. Empty: "No reviews yet."

### C-04 Cart
- **Purpose:** review items before paying.
- **Shows:**
  - **Cart lines:** image, product name, Tier + purity + size, unit price, quantity stepper, remove.
  - **Price summary:** subtotal, shipping ₱50.00, total.
  - **Checkout** button.
- **Line problems** (each shown on the line):
  - "Out of stock": the line is excluded from the total.
  - "Only 2 left, quantity updated".
  - "No longer available": a **Remove** action is offered.
- **Rules:**
  - Checkout is disabled while any line has a problem, or while offline.
  - The cart is saved on the phone and survives restarts.
- **States:** Empty: "Your cart is empty" with a **Browse medicines** button. Offline: the banner, with Checkout disabled.

### C-05 Checkout
- **Purpose:** pay.
- **Shows:**
  - **Deliver to:** the selected Address card, with **Change** opening a picker that has "Add new".
  - **Pay with:** the selected Card tile (VISA •••• 4242, 12/29), with **Change** opening a picker that has "Add new".
  - **Order summary:** the lines and the Price summary.
  - **Place order** button.
- **States:**
  - **Processing:** "Processing payment…" for about 2 seconds, blocking interaction.
  - **Errors** (shown as a dialog or banner, then back to the Cart for stock problems):
    - Sold out: "Blue Sky Cough Relief · 99.1% · 100ml just sold out. We've updated your cart."
    - Declined: "Your card was declined. Try another card."
    - Connection lost: "We couldn't confirm your order. **Retry**". A retry is safe and never charges twice.
  - No address or card saved yet: replace the section with "Add an address" / "Add a card".

### C-06 Order placed
- **Shows:** success illustration, "Order placed!", order number #3F9A1C2B, total paid ₱680.00, plus **View order** and **Keep shopping** buttons.

### C-07 Profile
- **Shows:** avatar, name, email, then menu rows: Edit profile, My Orders, Addresses, Cards, Log out.
- **Banner** when banned: "Your account is suspended. You can browse but not buy."

### C-08 Edit profile
- **Shows:** avatar (tap to change photo), full name, phone. Email is read-only. **Save**.

### C-09 My Orders
- **Shows:**
  - Filter chips: All · Paid · Packed · Shipped · Delivered · Cancelled.
  - A list of **Order rows**: order number, date "Nov 25, 2026", item count, total ₱680.00, **Status chip**.
- **States:** Standard states. Empty: "No orders yet" with a **Browse medicines** button.

### C-10 Order detail
- **Shows:**
  - Order number and date.
  - **Status timeline** (Paid → Packed → Shipped → Delivered, or the Cancelled state).
  - Items (with Tier + purity + size, quantity, price paid).
  - Price summary.
  - Shipped-to address and paid-with card (••••4242).
- **Actions:**
  - **Cancel order**, while Paid or Packed. A confirm dialog says: "Cancel this order? You'll get a full refund of ₱680.00."
  - **Write review** on each item once Delivered. It reads "Reviewed ★5" once done.

### C-11 Write review
- **Shows:** product name + variant bought, star picker 1–5 (required), comment (optional), **Submit**. Success: "Thanks for your review".

### C-12 Addresses / C-13 Add or edit address
- **C-12 shows:** a list of **Address cards** (label "Home", lines, city, "Default" tag), with Edit and Delete on each, and an **Add address** button.
- **C-13 shows:** label, line 1, line 2, city, province, postal code, country (default Philippines), a "Set as default" switch, **Save**.
- **States:** empty ("No saved addresses").

### C-14 Cards / C-15 Add card
- **C-14 shows:** a list of **Card tiles** (brand logo, •••• 4242, expiry, "Default"), with Delete and "Make default".
- **C-15 shows:**
  - Fields: cardholder name, card number (auto-spaced, with the brand logo appearing as you type), expiry MM/YY, CVV.
  - Note: "Mock payments only. Only the last 4 digits are saved."
  - **Save card** button.
- **Errors:** "Card number is invalid", "Card has expired", "CVV must be 3–4 digits".

---

## Admin, the owner (M)

### M-01 Dashboard
- **Shows:**
  - **Revenue** ₱64,210.00 ("from 112 delivered orders").
  - Orders by status: Paid 3 · Packed 1 · Shipped 2 (each taps to M-04 filtered).
  - **Customers** 18.
  - **Low stock:** a list of Variants with 5 or fewer left ("Blue Sky Cough Relief · 99.1% · 100ml, 2 left"). Tapping one opens M-03.
  - Shortcuts: **Add product** and **View orders**.
- **States:** loading, error. With no orders: "No orders yet".

### M-02 Products
- **Shows:**
  - Search, plus a "Show archived" toggle.
  - A list of **Managed product rows**: image, name, Category, number of variants, total stock, a warning ("1 variant out of stock"), and a status tag (Active or Archived).
  - An **Add product** button (FAB).
- **States:** Standard states. Empty: "No products yet" with an **Add product** button.

### M-03 Product editor
- **Purpose:** create or edit a Product.
- **Shows:**
  - **Images:** up to 5, reorderable, with add and remove.
  - **Details:** name, description, Category (dropdown).
  - **Variants list:** each row has purity % (with a live Tier badge preview), size label, price ₱, stock, and archive/remove. Plus an **Add variant** button.
  - **Save** button.
  - **Archive product** and **Delete product** (destructive), shown when editing.
- **Rules:**
  - At least 1 Variant is required.
  - Purity is 0–100 with one decimal. Price is above 0. Stock is 0 or more.
  - Delete is only possible if the product was never ordered. Otherwise show "This product has orders. Archive it instead."
- **States:**
  - Saving.
  - "Saved, but 1 image failed to upload. **Retry**".
  - Validation errors on each field.
  - Unsaved-changes confirmation on back.

### M-04 Orders
- **Shows:** status filter chips (Paid by default) and Order rows (order number, customer name, date, item count, total, Status chip).
- **States:** Standard states. Empty: "No paid orders right now."

### M-05 Order detail (admin)
- **Shows:** same content as C-10, plus the **customer's name, email and phone**.
- **Actions:**
  - One primary button that moves the order forward: **Mark as packed**, then **Mark as shipped**, then **Mark as delivered**. It's hidden once Delivered or Cancelled.
  - **Cancel order**, before Delivered, with a confirm dialog: "Cancel and refund ₱680.00? Stock will be restored."

### M-06 Categories / M-07 Add or edit category
- **M-06 shows:** a list (icon, name, product count), with Edit and Delete. Delete is blocked when products use the category: "Move or archive its 6 products first."
- **M-07 shows:** name and an icon picker (Material icons).

### M-08 Customers
- **Shows:** search, and a list of Customer rows (avatar, name, email, order count, "Banned" tag). Each row has **Ban** / **Unban**, with confirmation: "Banned customers can browse but can't order or review."

### M-09 Settings
- **Shows:** **Shipping fee per order** ₱50.00 (editable), with the note "Applies to new orders only". Also a **Log out** button.
