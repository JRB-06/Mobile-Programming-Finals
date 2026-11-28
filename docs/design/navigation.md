# Navigation

## Entry (everyone)
```
Splash ─┬─ not logged in ──► A-01 Login ◄─► A-02 Sign up
        │                       │  └─► A-03 Forgot password ─► (email) ─► A-04 Set new password
        │                       └─► (email not confirmed) A-05 Check your email
        ├─ Customer ───────────► C-01 Home
        ├─ Pharmacist, pending ─► A-06 Waiting for approval
        ├─ Pharmacist, approved ► P-01 Dashboard
        ├─ Admin ───────────────► M-01 Stats
        └─ Banned ──────────────► the user's normal home, with a "Your account is suspended" banner; buying/selling disabled
```
Email links (confirm email, reset password) and Google sign-in open the browser and come back into the app.

## Customer

**Top bar** (on Home and Store pages): logo, **Cart** icon with an item-count badge.
**Bottom bar:** **Search** · **Profile**. "Search" is the Home tab.

```
C-01 Home / Search stores ─► C-02 Store page ─► C-03 Product page ─► (add to cart)
        Top bar Cart ─► C-04 Cart ─► C-05 Checkout ─► C-06 Order placed ─► C-01 Home
                                        │
                                        └─► C-14 Add address / C-16 Add card (inline, if none saved)

C-07 Profile ─┬─► C-08 Edit profile
              ├─► C-09 My Orders ─► C-10 Order detail ─► C-11 Write review
              ├─► C-12 Addresses ─► C-13 Add/Edit address
              ├─► C-15 Cards ─► C-16 Add card
              ├─► C-17 Apply as pharmacist
              └─► Log out
```

## Pharmacist

**Bottom bar** (suggested; the layout is your call): **Dashboard** · **Products** · **Orders** · **Store**

```
P-01 Dashboard (earnings, recent orders)
P-02 My Products ─► P-03 Product editor (details, images, variants)
P-04 Incoming Orders ─► P-05 Order detail (advance status)
P-06 Store profile (name, logo, description) ─► Log out
```

## Admin

**Bottom bar or drawer** (suggested): **Stats** · **Applications** · **Users** · **Products** · **Orders**, with Categories and Settings reached from Stats.

```
M-01 Stats ─┬─► M-07 Categories ─► M-08 Add/Edit category
            └─► M-09 Settings (shipping fee) ─► Log out
M-02 Applications ─► M-03 Application detail (approve / reject)
M-04 Users (search, ban)
M-05 Products (search, hide)
M-06 Orders ─► C-10-style order detail with "Set status"
```

## Back behavior
- The Android back button goes back one screen.
- From C-06 Order placed, back goes to Home, not to Checkout.
- After logout, back can't return into the app.
