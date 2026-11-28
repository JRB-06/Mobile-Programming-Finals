# Los Pollos Hermanos

A multi-store online pharmacy themed after Breaking Bad. **Customers** buy fictional **Products** from **Stores** run by **Pharmacists**.

## People

**User**:
Anyone with an account. Each User has exactly one **Role**.
_Avoid_: Account, member

**Role**:
What a **User** is allowed to do: **Customer**, **Pharmacist** or **Admin**. Roles are exclusive.
_Avoid_: Permission, user type

**Customer**:
A **User** who buys **Products**.
_Avoid_: Buyer, client, shopper

**Pharmacist**:
A **User** who runs exactly one **Store**. A Pharmacist can't sell until approved, and doesn't buy.
_Avoid_: Seller, vendor, merchant, store owner

**Admin**:
A **User** who approves **Pharmacists**, bans **Users**, hides **Products** and oversees all **Orders**.
_Avoid_: Moderator, superuser

**Application**:
A **Pharmacist**'s request to sell, made at signup. It is pending until an **Admin** approves or rejects it. A rejected applicant becomes a **Customer**.
_Avoid_: Registration, verification

**Ban**:
An **Admin** action that stops a **User** from buying or selling. Banning a **Pharmacist** removes their **Store** from the shop.
_Avoid_: Suspension, block, deactivation

## Catalog

**Store**:
The shop a **Pharmacist** runs: name, logo, description and its **Products**. Its rating is the average of its **Products**' **Reviews**.
_Avoid_: Shop, pharmacy, vendor

**Product**:
A fictional medicine sold by one **Store**, sold through one or more **Variants**. Shown on screen as "medicine" if the design calls for it.
_Avoid_: Medicine (in code), item, listing

**Category**:
An **Admin**-managed grouping of **Products** (e.g. Cough & Cold, Pain Relief).
_Avoid_: Type, department

**Variant**:
A buyable version of a **Product**, defined by its **Purity** and **Size**. Each Variant has its own price and **Stock**.
_Avoid_: SKU, option, grade

**Purity**:
A **Variant**'s quality as a percentage, from 0 to 100.
_Avoid_: Quality, grade, potency

**Tier**:
The badge for a **Purity** range: **Street** below 80%, **Pharma** 80 to below 99%, **Blue Sky** 99% and above.
_Avoid_: Level, rank, class

**Size**:
A **Variant**'s amount as a label, e.g. "100ml" or "30 tabs".
_Avoid_: Volume, quantity, pack

**Stock**:
How many units of a **Variant** are available to buy right now.
_Avoid_: Inventory, quantity on hand

**Archived**:
The state of a **Product** or **Variant** its **Pharmacist** removed from sale. It no longer appears in the shop or the **Cart**, but past **Orders** and **Reviews** still show it.
_Avoid_: Deleted, removed, inactive

**Hidden**:
The state of a **Product** an **Admin** pulled from the shop. Only an **Admin** can unhide it.
_Avoid_: Blocked, taken down, archived

## Buying

**Cart**:
The **Variants** and quantities a **Customer** plans to buy. A Cart can hold **Variants** from several **Stores**, and always shows current prices.
_Avoid_: Basket, bag

**Checkout**:
One payment by a **Customer** for their whole **Cart**. It creates one **Order** per **Store** in the **Cart**.
_Avoid_: Purchase, transaction, payment

**Order**:
The part of a **Checkout** that one **Store** fulfills, with its own **Order Status**. It is cancelled as a whole.
_Avoid_: Sub-order, shipment, purchase

**Order Item**:
One **Variant** in an **Order**, with the quantity and the price paid at **Checkout**.
_Avoid_: Line item, cart item

**Order Status**:
Where an **Order** is: **Paid** → **Packed** → **Shipped** → **Delivered**, or **Cancelled**. The **Pharmacist** moves it forward. The **Customer** can cancel before Shipped. An **Admin** can set any Order Status.
_Avoid_: State, stage

**Subtotal**:
The sum of an **Order**'s **Order Items** (price × quantity).
_Avoid_: Amount, price

**Shipping Fee**:
A flat charge per **Order**, set by an **Admin**. A change applies to future **Orders** only.
_Avoid_: Delivery fee, shipping cost

**Platform Fee**:
2% of an **Order**'s **Subtotal**, paid by the **Customer** and kept by the platform.
_Avoid_: Service fee, commission

**Order Total**:
**Subtotal** + **Shipping Fee** + **Platform Fee**.
_Avoid_: Grand total, amount due

**Refund**:
A mock return of the full **Order Total** when an **Order** is **Cancelled**, together with restoring its **Stock**.
_Avoid_: Reversal, chargeback

**Review**:
A **Customer**'s 1–5 star rating and comment on a **Product**, written from one **Delivered** **Order Item**, at most once per **Order Item**.
_Avoid_: Rating, feedback, comment

**Address**:
A **Customer**'s delivery location, one of which is the default. An **Order** keeps a copy of the Address it shipped to.
_Avoid_: Location, shipping info

**Card**:
A **Customer**'s mock payment card. Only its brand, last four digits and expiry are kept.
_Avoid_: Payment method, credit card

## Money views

**Earnings**:
A **Pharmacist**'s total **Subtotal** across their **Delivered** **Orders**.
_Avoid_: Revenue, sales, income

**Platform Revenue**:
The total **Platform Fee** across all **Delivered** **Orders**.
_Avoid_: Profit, earnings

**GMV**:
The total **Order Total** across all **Orders** that aren't **Cancelled**.
_Avoid_: Sales, volume, turnover
