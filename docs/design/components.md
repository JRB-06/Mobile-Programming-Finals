# Components

Build these once on the `Components` page and reuse them. Each lists the variants and states it needs. The look is open.

## Shared states (used by every data screen)
| Component | Variants / content |
|---|---|
| **Loading** | Skeleton placeholders shaped like the content (preferred over a spinner for lists) |
| **Empty state** | Icon/illustration, a one-line title, optional helper text, optional action button |
| **Error state** | "Something went wrong", a short reason, **Retry** button |
| **Offline banner** | A thin bar at the top: "You're offline. Showing saved data." It sits above the content; it isn't a dialog. |
| **Suspended banner** | "Your account is suspended. You can browse but not buy." |
| **Snackbar** | Short confirmation with an optional action ("Added to cart · View cart") |
| **Confirm dialog** | Title, one sentence, a destructive or primary action, and Cancel |
| **Blocking progress** | Full-screen overlay with a message ("Processing payment…") |

## Badges and chips
| Component | Variants |
|---|---|
| **Tier badge** | **Street** (<80%), **Pharma** (80–98.9%), **Blue Sky** (≥99%). Sizes: small (cards) and large (product page). It must include the text label, not just color. Optionally shows the purity: "Blue Sky · 99.1%". |
| **Order status chip** | Paid, Packed, Shipped, Delivered, Cancelled |
| **Stock label** | "30 in stock", "Only 3 left" (≤5), "Out of stock" |
| **Product status tag** | Active, Archived |
| **Default tag** | For Addresses and Cards |
| **Rating** | ★ 4.8 (12) inline, plus a 1–5 star picker (C-11) |
| **Filter chip** | Selected / unselected, used for Category, Tier and status filters |
| **Cart icon with badge** | Count from 0 (no badge) to 99+ |

## Cards and rows
| Component | Content | States |
|---|---|---|
| **Product card** | Image, name, Category, price range "₱180.00 – ₱450.00" (or one price), best Tier badge, rating, "Out of stock" overlay | In stock, out of stock |
| **Variant option** | Tier badge, purity, size, price, stock label | Selected, unselected, disabled (out of stock) |
| **Cart line** | Image, product name, Tier + purity + size, unit price, quantity stepper, remove | Normal, out of stock, reduced stock, unavailable |
| **Price summary** | Subtotal, Shipping, Total | Normal, and "Refunded" (strikethrough or label) for cancelled orders |
| **Order row** | Order number, date, item count, total, status chip (+ customer name for the Admin) | One per status |
| **Status timeline** | Paid → Packed → Shipped → Delivered, with done/current/upcoming steps and timestamps | Each step current, plus Cancelled |
| **Review tile** | Name, stars, date, "Bought: 99.1% · 100ml", comment | With and without comment |
| **Address card** | Label, lines, city/province/postal, Default tag | Selected (in the checkout picker), unselected |
| **Card tile** | Brand logo (Visa / Mastercard / Amex), •••• 4242, expiry, Default tag | Selected, unselected, expired |
| **Managed product row** | Image, name, Category, variant count, total stock, warning, status tag | Active, archived |
| **Low-stock row** | Product name, Tier + purity + size, "2 left" | |
| **Variant editor row** | Purity field + live Tier preview, size, price, stock, remove | Valid, with field errors |
| **Stat tile** | Label, big number, small caption | |
| **Customer row** | Avatar, name, email, order count, banned tag, ban/unban button | Active, banned |

## Inputs
| Component | Notes |
|---|---|
| Text field | Label, hint, error text, disabled. Password field adds show/hide. |
| Money field | Prefix ₱, 2 decimals |
| Purity field | Suffix %, 1 decimal, shows the Tier badge as you type |
| Card number field | Auto spacing `4242 4242 4242 4242`, brand logo appears |
| Quantity stepper | − / value / +. The + is disabled at stock; the − at 1 (in the cart, − at 1 asks to remove). |
| Dropdown / picker | Category select, status select (admin) |
| Image picker grid | Up to 5 tiles, add tile, remove ×, drag to reorder |
| Buttons | Primary, secondary, text, destructive. Each has a loading state (spinner inside, label kept). |

## Navigation
| Component | Notes |
|---|---|
| Top app bar | Customer: logo + Cart. Inner screens: back + title. |
| Bottom nav bar | Customer: Search, Profile. The admin bar is suggested in navigation.md. |
| FAB | "Add product" (M-02) |
