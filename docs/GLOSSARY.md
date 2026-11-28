# Los Pollos Hermanos

The online pharmacy of **Los Pollos Hermanos**, a closed market with one seller. **Customers** pick a **Pharmacist** and buy that Pharmacist's **Products**, and the **Admin** (the owner) runs the catalog, **Stock** and **Orders**.

## People

**User**:
Anyone with an account. Each User has exactly one **Role**.
_Avoid_: Account, member

**Role**:
What a **User** is allowed to do: **Customer** or **Admin**. A **Pharmacist** is not a Role.
_Avoid_: Permission, user type

**Customer**:
A **User** who buys **Products**. Every signup is a Customer.
_Avoid_: Buyer, client, shopper

**Admin**:
The owner of Los Pollos Hermanos. The Admin manages **Pharmacists**, **Products**, **Categories**, **Stock**, **Orders**, **Bans** and the **Shipping Fee**. Admins exist only through seed data.
_Avoid_: Owner (in code), moderator, seller, superuser

**Pharmacist**:
A Los Pollos Hermanos employee whose **Products** a **Customer** browses. The Admin creates, edits and archives Pharmacists; a Pharmacist has no account or login.
_Avoid_: Seller, store owner, dealer

**Ban**:
An **Admin** action that stops a **Customer** from placing **Orders** or writing **Reviews**.
_Avoid_: Suspension, block, deactivation

## Catalog

**Product**:
A medicine sold by Los Pollos Hermanos under one **Pharmacist**, sold through one or more **Variants**. Shown on screen as "medicine" if the design calls for it.
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

**Low Stock**:
A **Variant** with 5 or fewer units of **Stock** left.
_Avoid_: Running out, scarce

**Archived**:
The state of a **Product** or **Variant** the **Admin** took off sale. It no longer appears in the shop or the **Cart**, but past **Orders** and **Reviews** still show it.
_Avoid_: Deleted, hidden, removed, inactive

## Buying

**Cart**:
The **Variants** and quantities a **Customer** plans to buy. It always shows current prices.
_Avoid_: Basket, bag

**Order**:
One purchase of the whole **Cart**, paid at checkout, with its own **Order Status**. It is cancelled as a whole.
_Avoid_: Purchase, transaction, checkout

**Order Item**:
One **Variant** in an **Order**, with the quantity and the price paid.
_Avoid_: Line item, cart item

**Order Status**:
Where an **Order** is: **Paid** → **Packed** → **Shipped** → **Delivered**, or **Cancelled**. The **Admin** moves it forward one step at a time. The **Customer** can cancel before Shipped. The **Admin** can cancel before Delivered.
_Avoid_: State, stage

**Subtotal**:
The sum of an **Order**'s **Order Items** (price × quantity).
_Avoid_: Amount, price

**Shipping Fee**:
A flat charge per **Order**, set by the **Admin**. A change applies to future **Orders** only.
_Avoid_: Delivery fee, shipping cost

**Order Total**:
**Subtotal** + **Shipping Fee**.
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

## Numbers

**Revenue**:
The total **Order Total** across all **Delivered** **Orders**.
_Avoid_: Sales, earnings, GMV, income
