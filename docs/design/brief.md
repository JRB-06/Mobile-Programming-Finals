# Design brief

## The product

**Los Pollos Hermanos** is the online pharmacy of Los Pollos Hermanos, themed after *Breaking Bad*:
- It's a **closed market**: Los Pollos Hermanos is the only seller.
- Customers browse the catalog and buy medicines.
- Every Product comes in **Variants** that differ by **purity %** and **size**, each with its own price and stock.
- The **Admin** is the owner. They manage products, stock and orders from inside the same app.

It's a school final project, due the first week of December 2026, and it'll be demoed on an Android phone emulator (Pixel 8) and a Samsung Galaxy Tab A7 tablet.

## Who uses it

| Role | Goal in one line | Where they spend time |
|---|---|---|
| **Customer** | Find a medicine, pick the right Variant, pay, track the Order | Home (catalog), Product page, Cart, Checkout, My Orders |
| **Admin (owner)** | Keep the shelves stocked and ship Orders | Dashboard, Products, Product editor, Orders |

The two roles never mix: the Admin doesn't shop. Each role gets its own navigation (see navigation.md).

Everyone must log in first. There's no browsing without an account.

## Theme cues (inspiration, not rules)

The show should come through in the theme, not in real drug references:
- **The Los Pollos Hermanos brand itself:** the family-business warmth and the yellow/red fast-food palette, with a pharmacy twist.
- Chemistry-lab and periodic-table imagery: element tiles like **Br** and **Ba**.
- Purity as a hero number (e.g. "99.1%").
- A signature blue for the top "Blue Sky" Tier.
- Desert / New Mexico warmth.
- Product names are and harmless: "Blue Sky Cough Relief", "Crystal Clear Vitamin C". **No real drug names, no drug paraphernalia imagery.**

It should still read as a **trustworthy pharmacy** at first glance. The jokes are in the details.

## Signature elements the design must cover

1. **Tier badge**, shown wherever a purity appears:
   - **Street** below 80%
   - **Pharma** 80–98.9%
   - **Blue Sky** 99% and up

   It should be recognisable at small sizes (product cards) and large ones (product page).
2. **Order status**: paid → packed → shipped → delivered, or cancelled. It appears as a chip in lists and as a timeline in the order detail.
3. **Money breakdown**: subtotal, shipping ₱50, total. It appears in the Cart, Checkout and Order detail.
4. **Offline banner**: the app works read-only offline, so the user must always know when they're offline.

## Constraints

- Android, portrait only, 412 × 915 frame. The final APK is also installed on a Samsung Galaxy Tab A7 tablet (about 800 × 1280 dp portrait), so layouts must still look right when the screen is roughly twice as wide.
- Tap targets at least 48 × 48. Text must stay readable when the system font is set larger. Color can't be the only signal: Tier and status chips need text too.
- Every screen that loads data needs **loading, empty, error and offline** states (components.md has shared versions).
- Images are square product photos (800 × 800). Placeholders come from picsum.photos in the mock data.
