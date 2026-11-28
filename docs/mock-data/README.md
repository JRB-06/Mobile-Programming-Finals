# Mock data templates

Fill these CSVs with **fictional** data. Keep the header row exactly as it is. Rows reference each other by **email / store name / product name / label / ref**, not by ids; the seed script resolves the ids.

| File | Notes |
|---|---|
| users.csv | `role` is `admin`, `pharmacist` or `customer`. Make at least 1 admin, 3–5 pharmacists and 5+ customers. The password is used to create the Supabase Auth user. |
| stores.csv | One row per pharmacist (`owner_email`). `status` is `approved`, `pending` or `rejected`. Include at least one `pending` store so the Admin approval flow can be demoed. |
| categories.csv | `icon` is a Material icon name (e.g. `healing`, `air`, `eco`). |
| products.csv | `category` must match categories.csv. Separate multiple `image_urls` with `\|`. Free placeholder images: `https://picsum.photos/seed/<word>/800/800`. Product names are fictional; no real drug names. |
| variants.csv | `purity` is 0–100 with one decimal (Tier: <80 Street, 80–98.9 Pharma, ≥99 Blue Sky). `stock` 0 shows "Out of stock". Give each product 1–3 variants. |
| addresses.csv / cards.csv | Customers only. One `is_default=true` per user. Cards: brand + last4 only (`visa`, `mastercard`, `amex`). |
| orders.csv | One row per Order (one Store). Orders sharing a `checkout_ref` were paid together. `status` is `paid`, `packed`, `shipped`, `delivered` or `cancelled`. The seed computes subtotal, ₱50 shipping, the 2% fee and the total. |
| order_items.csv | A variant is identified by `product_name` + `purity` + `size_label` within the order's store. The price is taken from variants.csv. |
| reviews.csv | Only for `delivered` orders. One per order item. |

Wrap any field that contains a comma in double quotes.
