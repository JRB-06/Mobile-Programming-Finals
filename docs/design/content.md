# Content and formats

Use these exact formats and words. Copy marked *suggested* can be reworded, as long as the meaning stays.

## Names (from docs/GLOSSARY.md)
Use **Pharmacist** (an employee record, never an account), **Product** (screens may say "medicine"), **Variant** (on screen: "option"), **Order**, **Cart**, **Checkout**, **Review**, **Address**, **Card**. Show a Product's pharmacist as "Handled by {Pharmacist}".

## Formats
| Thing | Format | Example |
|---|---|---|
| Money | ₱, thousands comma, always 2 decimals | ₱1,234.50 · ₱50.00 |
| Price range | low – high | ₱180.00 – ₱450.00 |
| Purity | 1 decimal + % | 99.1% · 70.0% |
| Variant label | purity · size | 99.1% · 100ml |
| Tier | Street · Pharma · Blue Sky | |
| Date | Mon D, YYYY | Nov 25, 2026 |
| Date + time (timeline) | Mon D, h:mm a | Nov 25, 2:30 PM |
| Rating | ★ average (count) | ★ 4.8 (12) |
| Card | BRAND •••• last4 · MM/YY | VISA •••• 4242 · 12/29 |
| Order number | # + first 8 characters of the id, uppercase | #3F9A1C2B |

## Order status labels
| Status | Customer sees | Admin button to reach it |
|---|---|---|
| paid | Paid | (starts here) |
| packed | Packed | Mark as packed |
| shipped | Shipped | Mark as shipped |
| delivered | Delivered | Mark as delivered |
| cancelled | Cancelled · Refunded | (none) |

## Error messages (*suggested*)
| When | Message |
|---|---|
| Wrong login | Wrong email or password. |
| Email not confirmed | Please confirm your email first. |
| Email taken | An account with this email already exists. |
| Weak password | Use at least 8 characters, including a number. |
| Offline action | You're offline. Connect to the internet to do this. |
| Sold out at checkout | {Product} · {variant label} just sold out. We've updated your cart. |
| No longer available | {Product} is no longer available. |
| Card declined | Your card was declined. Try another card. |
| Checkout connection lost | We couldn't confirm your order. Retry. (Retrying never charges twice.) |
| Can't cancel | This order has already shipped and can't be cancelled. |
| Already reviewed | You've already reviewed this item. |
| Delete product with orders | This product has orders. Archive it instead. |
| Delete category in use | Move or archive its {n} products first. |
| Suspended | Your account is suspended. You can browse but not buy. |
| Not allowed | You don't have permission to do that. |
| Anything else | Something went wrong. Please try again. |

## Empty states (*suggested*)
| Screen | Title | Action |
|---|---|---|
| Pharmacist directory search | No pharmacists match "{query}" | Clear search |
| Pharmacist products search | No medicines from this pharmacist match "{query}" | Clear filters |
| Home search | No medicines match "{query}" | Clear filters |
| Cart | Your cart is empty | Browse medicines |
| My Orders | No orders yet | Browse medicines |
| Reviews | No reviews yet | (none) |
| Addresses / Cards | No saved addresses / cards | Add address / Add card |
| Admin products | No products yet | Add product |
| Admin pharmacists | No pharmacists yet | Add pharmacist |
| Incoming orders | No paid orders right now | (none) |
| Admin customers search | No customers match "{query}" | (none) |

## Tone
Friendly and clear, like a real pharmacy. Show references fit in names, empty states and success screens ("Yeah, science!" on Order placed is fine). Keep them out of errors and anything involving money.
