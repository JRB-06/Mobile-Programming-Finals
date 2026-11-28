# Module interfaces (the backend ↔ frontend contract)

This is the contract from PRD §13. Frontend builds against these **interfaces**. Backend supplies two **adapters** for each one:
- **Fake:** in-memory, with seeded data. Available from day 1, and used in widget tests.
- **Supabase:** the real thing.

Having two adapters is what makes the repository layer a real **seam**. Swapping between them is one provider override in `main.dart`.

Terms follow `docs/GLOSSARY.md`.

## Design rules

- **Few modules, deep ones.** 7 repositories plus 5 pure `core/` modules. Each repository hides Supabase, sqflite, caching, image uploads and RLS behind a handful of methods.
- **RLS does the scoping, so the interface doesn't.** `OrderRepository.list()` returns "the Orders this User may see": their own for a Customer, all of them for the Admin. There's no separate method per Role. Pharmacists are catalog records, not Users: Customers read non-archived ones only; only the Admin writes them.
- **Offline is hidden inside the adapter.** Read methods return cached data when the network fails, and throw `OfflineException` only when there's no cache. The offline banner comes from `connectivityProvider`, not from the repositories.
- **Money is `int` centavos in Dart** (`Money`), never `double`. Adapters convert Postgres `numeric` at the edge. `₱680.00` is `Money(68000)`.
- **Stream for state, Future for actions.** Auth and the Cart are streams, because several screens watch them. Everything else is request/response.
- **Every failure is an `AppException`** with a user-readable `message`. Controllers wrap calls in `AsyncValue.guard`.

## Pure modules (`lib/core/`, no I/O, unit-tested first)

| Module | Interface | Invariants pinned by tests |
|---|---|---|
| `Money` | `Money(int centavos)`, `+`, `*int`, `format()` → `₱1,234.50`, `Money.parse(num/String)` | Never uses `double` math. `Money.parse('680.00') == Money(68000)`. |
| `OrderMath` | `OrderQuote quoteOrder({lines, shippingFee})` → subtotal, shippingFee, total | Matches `place_order` for the same input. **The database is authoritative**; this is only the Cart/Checkout preview. |
| `Tier` | `enum Tier { street, pharma, blueSky }`, `Tier.fromPurity(num)` | 79.9 → street, 80 → pharma, 98.9 → pharma, 99 → blueSky. Same thresholds as SQL `tier_of`. |
| `CardValidator` | `CardCheck checkCard(number, expMonth, expYear, cvv, {DateTime? now})` → `CardValid(brand, last4)` or `CardInvalid(field, message)` | Luhn, expiry not past, CVV 3–4 digits, brand from prefix (4 Visa, 51–55 Mastercard, 34/37 Amex). `4000000000000002` passes validation (it's declined later, at checkout). |
| `OrderStatus` | `enum { paid, packed, shipped, delivered, cancelled }`, `next`, `canCustomerCancel`, `canAdminCancel` | One step forward at a time. Customers cancel only before `shipped`; the Admin before `delivered`. Nothing moves out of `delivered` or `cancelled`. |

## Repositories (`lib/data/repositories.dart`)

### AuthRepository
```dart
Stream<AppUser?> watchUser();            // null = logged out; re-emits when role or ban changes
Future<void> signUp({required String fullName, required String email, required String password});
Future<void> signIn(String email, String password);
Future<void> signInWithGoogle();         // opens browser; watchUser emits when the deep link returns
Future<void> resendConfirmation(String email);
Future<void> sendPasswordReset(String email);
Future<void> updatePassword(String newPassword);   // from the reset deep link
Future<void> signOut();                  // also clears all local data (cart, cache)
```
`AppUser`: id, email, fullName, phone, avatarUrl, `role` (customer/admin), `isBanned`. **The router reads only this.**
Errors: `InvalidCredentialsException`, `EmailNotConfirmedException`, `EmailInUseException`, `WeakPasswordException`.

### CatalogRepository (read-only shop)
```dart
Future<Page<Pharmacist>> pharmacists({String query = '', int page = 0});   // the directory
Future<Page<ProductCard>> searchProducts({String query = '', ProductFilter filter = const ProductFilter(), int page = 0});
Future<ProductDetail> getProduct(String productId);              // pharmacist, images, variants, rating
Future<Page<Review>> productReviews(String productId, {int page = 0});
Future<List<Category>> categories();
```
`Pharmacist`: id, name, photoUrl, specialty?, archived. `PharmacistInput(id?, name, photoUrl, specialty?)`: `id` null means create, otherwise update. `ProductFilter`: pharmacistId?, categoryId?, tier?, sort (newest / priceAsc / priceDesc / rating). Pages hold 20 items.
`ProductCard`: id, name, imageUrl, categoryName, pharmacistId, pharmacistName, minPrice, maxPrice, bestTier, inStock, rating, reviewCount.
`ProductDetail`: the `ProductCard` fields plus description, pharmacistPhotoUrl and Variants.
Cached in sqflite: pharmacist directory pages, search pages and categories. Archived Pharmacists, Products and Variants never appear.

### CartRepository (local only)
```dart
Stream<Cart> watchCart();                            // lines with live price/stock/availability + quote
Future<void> add(String variantId, {int qty = 1});   // adds to the existing line; caps at stock
Future<void> setQty(String variantId, int qty);      // qty 0 removes the line
Future<void> remove(String variantId);
```
`Cart`: lines, `OrderQuote` preview (lines with problems are excluded), itemCount, `canCheckout`.
`CartLine`: variantId, productId, product name, pharmacistName, variant label, Tier, image, unitPrice (current), qty, `availability` (ok / outOfStock / reducedStock(max) / unavailable).
Errors: `OutOfStockException` on `add`.

### CheckoutRepository
```dart
Future<Order> placeOrder({
  required String orderId,         // generate once per tap (Uuid().v4()); reuse it on retry
  required String addressId,
  required String cardId,
});                                // reads the global Cart itself; on success removes the ordered lines
Future<Money> shippingFee();       // current fee, for the preview
```
One checkout is one Order even if lines come from several pharmacists; each Order Item snapshots `pharmacistName`.
Errors:
- `OutOfStockException(variantId)` and `UnavailableException(variantId)`: nothing is charged, and the Cart is left as it was.
- `CardDeclinedException`: test number `…0002`.
- `BannedException`.
- `OfflineException`: retrying with the **same** `orderId` is always safe.

### OrderRepository
```dart
Future<Page<Order>> list({OrderStatus? status, int page = 0});   // Customer: own. Admin: all (RLS).
Future<OrderDetail> get(String orderId);       // items (with pharmacistName), address snapshot, card last4, timeline, reviewable items, customer (admin)
Future<Order> cancel(String orderId);          // Customer before shipped, Admin before delivered; restores stock
Future<Order> advance(String orderId);         // Admin only: the next status
Future<void> review(String orderItemId, {required int rating, String? comment});   // Customer; delivered, once per item
```
Errors: `InvalidTransitionException`, `AlreadyReviewedException`, `PermissionException`, `BannedException`.

### AccountRepository (Customer self-service)
```dart
Future<AppUser> updateProfile({String? fullName, String? phone, File? avatar});
Future<List<Address>> addresses();
Future<Address> saveAddress(AddressInput a);        // create or update; isDefault unsets the others
Future<void> deleteAddress(String id);
Future<List<SavedCard>> cards();
Future<SavedCard> addCard(CardInput c);             // validates with checkCard; stores brand + last4 + expiry only
Future<void> deleteCard(String id);
Future<void> setDefaultCard(String id);
```

### InventoryRepository (Admin: catalog management)
```dart
Future<Page<Pharmacist>> pharmacists({String query = '', bool includeArchived = false, int page = 0});
Future<Pharmacist> savePharmacist(PharmacistInput p);   // create when id == null, update otherwise: name, photoUrl, specialty
Future<void> setPharmacistArchived(String pharmacistId, bool archived);   // Archive, never delete
Future<Page<ManagedProduct>> products({String query = '', bool includeArchived = false, int page = 0});
Future<ManagedProduct> getProduct(String productId);
Future<ManagedProduct> saveProduct(ProductInput p);
    // create or update in one call: fields (including required pharmacistId), variants (add/edit/archive), new image files, removed images, image order.
    // Rows are written first, then images; a failed upload throws PartialSaveException(product).
Future<void> setArchived(String productId, bool archived);
Future<void> deleteProduct(String productId);   // throws HasOrdersException; archive instead
Future<List<LowStockVariant>> lowStock();       // non-archived variants with stock <= 5
Future<Category> saveCategory(CategoryInput c);
Future<void> deleteCategory(String id);          // throws InUseException when Products use it
```

### AdminRepository (Admin: customers, settings, numbers)
```dart
Future<Page<CustomerRow>> customers({String query = '', int page = 0});
Future<void> setBanned(String userId, bool banned);
Future<void> setShippingFee(Money fee);          // new Orders only
Future<Dashboard> dashboard();                   // revenue, ordersByStatus, customerCount, lowStockCount
```
Order management for the Admin goes through `OrderRepository`, where RLS gives them every Order. Pharmacist management is catalog management, so it lives in `InventoryRepository`; `AdminRepository` is unchanged.

## Shared types
- `Page<T>`: items, page, hasMore.
- `AppException` (sealed, each with `message`):
  - Offline, InvalidCredentials, EmailNotConfirmed, EmailInUse, WeakPassword, Permission, Banned
  - OutOfStock(variantId), Unavailable(variantId), CardDeclined
  - InvalidTransition, AlreadyReviewed, HasOrders, InUse, PartialSave, Validation(field)
  - Unknown

## Providers (`lib/data/providers.dart`)
One provider per repository, plus `connectivityProvider` and `currentUserProvider` (from `watchUser`).

`main.dart` picks the adapters:
- `--dart-define=FAKE_DATA=true` uses every Fake. Frontend works this way until the backend is ready.
- Otherwise every Supabase adapter is used.

## Deliberately not interfaces
- **Image upload:** it's inside `saveProduct` and `updateProfile`. No caller uploads on its own.
- **sqflite DAOs:** internal seams of `CatalogRepository` and `CartRepository`, tested through their repository.
- **Role checks in Dart:** the router reads `AppUser.role`, and the database enforces it. Repositories don't re-check.
