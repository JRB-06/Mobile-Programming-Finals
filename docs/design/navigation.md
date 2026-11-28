# Navigation

## Entry (everyone)
```
Splash ─┬─ not logged in ──► A-01 Login ◄─► A-02 Sign up
        │                       │  └─► A-03 Forgot password ─► (email) ─► A-04 Set new password
        │                       └─► (email not confirmed) A-05 Check your email
        ├─ Customer ───────────► C-01 Home
        └─ Admin ──────────────► M-01 Dashboard
```
- Email links (confirm email, reset password) and Google sign-in open the browser and come back into the app.
- A banned Customer still lands on Home, with a "Your account is suspended" banner. Checkout and reviews are disabled.

## Customer

**Top bar** (on Home and Product pages): logo, **Cart** icon with an item-count badge.
**Bottom bar:** **Search** · **Profile**. "Search" is the Home tab.

```
C-01 Home (pharmacist directory + search) ─► C-01A Pharmacist products ─► C-02 Product page ─► (add to cart)
        Top bar Cart ─► C-04 Cart ─► C-05 Checkout ─► C-06 Order placed ─► C-01 Home
                                        │
                                        └─► C-13 Add address / C-15 Add card (inline, if none saved)
C-02 Product page ─► C-03 All reviews

C-07 Profile ─┬─► C-08 Edit profile
              ├─► C-09 My Orders ─► C-10 Order detail ─► C-11 Write review
              ├─► C-12 Addresses ─► C-13 Add/Edit address
              ├─► C-14 Cards ─► C-15 Add card
              └─► Log out
```

## Admin (owner)

**Bottom bar** (suggested; the layout is your call): **Dashboard** · **Products** · **Orders** · **More**

```
M-01 Dashboard (revenue, orders by status, low stock) ─► M-02/M-03 (tap a low-stock item)
M-02 Products ─► M-03 Product editor (details, images, variants)
M-04 Orders ─► M-05 Order detail (advance status / cancel)
More ─┬─► M-10 Pharmacists ─► M-11 Add/Edit pharmacist
      ├─► M-06 Categories ─► M-07 Add/Edit category
      ├─► M-08 Customers (search, ban)
      ├─► M-09 Settings (shipping fee)
      └─► Log out
```

## Back behavior
- The Android back button goes back one screen.
- From C-06 Order placed, back goes to Home, not to Checkout.
- After logout, back can't return into the app.
