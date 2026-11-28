# Mock data templates

Fill these CSVs with **fake** data. Keep the header row exactly as is. Rows reference each other by **email / title / label** (not ids), and the seed importer resolves the ids.

| File | Notes |
|---|---|
| users.csv | `role` = `admin` or `customer`. Make at least 1 admin and 5+ customers. The password is used to create the Supabase Auth user. |
| addresses.csv | `user_email` must exist in users.csv. One `is_default=true` per user. |
| payment_cards.csv | **brand + last4 only**, never full numbers. `brand` = `visa`, `mastercard` or `amex`. |
| categories.csv | `icon` = a Material icon name (e.g. `phone_android`, `chair`, `checkroom`). |
| listings.csv | `category` must match categories.csv. `condition` = `new`, `like_new`, `good`, `fair` or `poor`. `status` = `active`, `sold` or `hidden`. Separate multiple `image_urls` with `\|`. Free images: `https://picsum.photos/seed/<word>/800/600`. |
| orders.csv | One row per item. Rows with the same `order_ref` form one order. `status` = `pending`, `paid`, `shipped`, `completed` or `cancelled`. |
| reviews.csv | `order_ref` must be a **completed** order where the reviewer was the buyer. |

Commas inside a field? Wrap the field in double quotes.
