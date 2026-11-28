---
status: superseded by ADR-0005
---

# One Checkout creates one Order per Store

*Superseded:* the app became a closed market with a single seller (ADR 0005), so a checkout creates exactly one Order.

A Cart could hold Variants from several Stores. Checkout paid once but created a separate Order for each Store, because each Pharmacist fulfilled and shipped independently.
