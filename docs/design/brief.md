# Design brief

## The product

**Los Pollos Hermanos** is a pharmacy marketplace app themed after *Breaking Bad*:
- Customers browse **Stores**, each run by a **Pharmacist**, and buy fictional medicines.
- Every Product comes in **Variants** that differ by **purity %** and **size**, each with its own price and stock.
- Admins approve new Pharmacists and keep the marketplace clean.

It's a school final project, due the first week of December 2026, and it'll be demoed on an Android phone emulator (Pixel 8).

## Who uses it

| Role | Goal in one line | Where they spend time |
|---|---|---|
| **Customer** | Find a Store, pick the right Variant, pay, track the Order | Home (Store search), Store page, Product page, Cart, Checkout, My Orders |
| **Pharmacist** | Keep their Store stocked and ship Orders | Dashboard, My Products, Product editor, Incoming Orders |
| **Admin** | Approve Pharmacists, remove bad actors, watch the numbers | Applications, Users, Products, Orders, Stats |

The three roles never mix: a Pharmacist doesn't shop, and an Admin doesn't sell. Each role gets its own navigation (see navigation.md).

Everyone must log in first. There's no browsing without an account.

## Theme cues (inspiration, not rules)

The show should come through in the theme, not in real drug references:
- Chemistry-lab and periodic-table imagery: element tiles like **Br** and **Ba** work well for a logo.
- Purity as a hero number (e.g. "99.1%").
- A signature blue for the top "Blue Sky" Tier.
- Desert / New Mexico warmth as a possible secondary palette.
- Store names that are puns, such as "Gray Matter Pharmacy".
- Product names are fictional and harmless: "Blue Sky Cough Relief", "Crystal Clear Vitamin C". **No real drug names, no drug paraphernalia imagery.**

It should still read as a **trustworthy pharmacy** at first glance. The jokes are in the details.

## Signature elements the design must cover

1. **Tier badge**, shown wherever a purity appears:
   - **Street** below 80%
   - **Pharma** 80–98.9%
   - **Blue Sky** 99% and up

   It should be recognisable at small sizes (product cards) and large ones (product page).
2. **Order status**: paid → packed → shipped → delivered, or cancelled. It appears as a chip in lists and as a timeline in the order detail.
3. **Money breakdown** per Store: subtotal, shipping ₱50, platform fee 2%, total. It appears in the Cart, Checkout and Order detail.
4. **Offline banner**: the app works read-only offline, so the user must always know when they're offline.

## Constraints

- Android, portrait only, 412 × 915 frame. The final APK is also installed on a Samsung Galaxy Tab A7 tablet (about 800 × 1280 dp portrait), so layouts must still look right when the screen is roughly twice as wide.
- Tap targets at least 48 × 48. Text must stay readable when the system font is set larger. Color can't be the only signal: Tier and status chips need text too.
- Every screen that loads data needs **loading, empty, error and offline** states (components.md has shared versions).
- Images are square product photos (800 × 800) and square store logos (400 × 400). Placeholders come from picsum.photos in the mock data.
