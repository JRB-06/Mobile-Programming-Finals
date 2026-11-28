# Mock data templates

Fill these CSVs with **fictional** data. Keep the header row exactly as it is. Rows reference each other by **email / product name / label / ref**, not by ids; the seed tool resolves the ids.

Los Pollos Hermanos is the only seller, so there are no stores.

| File | Notes |
|---|---|
| users.csv | `role` is `admin` or `customer`. Make 1 admin (the owner) and 5+ customers. The password is used to create the Supabase Auth user. |
| categories.csv | `icon` is a Material icon name (e.g. `healing`, `air`, `eco`). |
| products.csv | `category` must match categories.csv. Separate multiple `image_urls` with `\|`. Free placeholder images: `https://picsum.photos/seed/<word>/800/800`. Product names are fictional; no real drug names. |
| variants.csv | `purity` is 0–100 with one decimal (Tier: <80 Street, 80–98.9 Pharma, ≥99 Blue Sky). `stock` 0 shows "Out of stock", and 1–5 shows as Low Stock on the admin dashboard. Give each product 1–3 variants. |
| addresses.csv / cards.csv | Customers only. One `is_default=true` per user. Cards: brand + last4 only (`visa`, `mastercard`, `amex`). |
| orders.csv | One row per Order. `status` is `paid`, `packed`, `shipped`, `delivered` or `cancelled`. The seed computes the subtotal, ₱50 shipping and the total. |
| order_items.csv | A variant is identified by `product_name` + `purity` + `size_label`. The price is taken from variants.csv. |
| reviews.csv | Only for `delivered` orders. One per order item. |

Wrap any field that contains a comma in double quotes.
