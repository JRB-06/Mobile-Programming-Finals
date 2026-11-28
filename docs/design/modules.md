# Module interfaces (the backend ↔ frontend contract)

This is the contract from PRD §13. Frontend builds against these **interfaces**. Backend supplies two **adapters** for each one:
- **Fake:** in-memory, with seeded data. Available from day 1, and used in widget tests.
- **Supabase:** the real thing.

Having two adapters is what makes the repository layer a real **seam**. Swapping between them is one provider override in `main.dart`.

Terms follow `docs/GLOSSARY.md`.

## Design rules

- **Few modules, deep ones.** 7 repositories plus 4 pure `core/` modules. Each repository hides Supabase, sqflite, caching, image uploads and RLS scoping behind a handful of methods.
- **RLS does the scoping, so the interface doesn't.** `OrderRepository.list()` returns "the Orders this User may see": their own for a Customer, their Store's for a Pharmacist, all of them for an Admin. There's no separate method per Role.
- **Offline is hidden inside the adapter.** Read methods return cached data when the network fails, and throw `OfflineException` only when there's no cache. The offline banner comes from `connectivityProvider`, not from the repositories.
- **Money is `int` centavos in Dart** (`Money`), never `double`. Adapters convert Postgres `numeric` at the edge. `₱692.60` is `Money(69260)`.
- **Stream for state, Future for actions.** Auth and the Cart are streams, because several screens watch them. Everything else is request/response.
- **Every failure is an `AppException`** with a user-readable `message`. Controllers wrap calls in `AsyncValue.guard`.

## Pure modules (`lib/core/`, no I/O, unit-tested first)

| Module | Interface | Invariants pinned by tests |
|---|---|---|
| `Money` | `Money(int centavos)`, `+`, `*int`, `percent(int basisPoints)` (rounds half away from zero, like Postgres `round`), `format()` → `₱1,234.50`, `Money.parse(num/String)` | 2% of ₱630.00 = ₱12.60. 2% of ₱0.25 = ₱0.01 (rounded half up). Never uses `double` math. |
| `OrderMath` | `OrderQuote quote(List<CartLine> storeLines, Money shippingFee)` → subtotal, shipping, platformFee, total | Matches `place_order` for the same input. **The database is authoritative**; this is only the Cart/Checkout preview. |
| `Tier` | `enum Tier { street, pharma, blueSky }`, `Tier.fromPurity(double)` | 79.9 → street, 80 → pharma, 98.9 → pharma, 99 → blueSky. Same thresholds as SQL `tier_of`. |
| `CardValidator` | `CardCheck check(number, expMonth, expYear, cvv, {DateTime? now})` → `valid(brand, last4)` or `invalid(field, message)` | Luhn, expiry not past, CVV 3–4 digits, brand from prefix (4 Visa, 51–55 Mastercard, 34/37 Amex). `4000000000000002` passes validation (it's declined later, at checkout). |
| `OrderStatus` | `enum { paid, packed, shipped, delivered, cancelled }`, `next`, `canCustomerCancel`, `canAdvanceTo(OrderStatus)` | Only one step forward at a time. Cancel only before `shipped`. Nothing moves out of `delivered` or `cancelled`. |

## Repositories (`lib/data/`)

### AuthRepository
```dart
Stream<AppUser?> watchUser();            // null = logged out; re-emits when role/ban/store status changes
Future<void> signUp(SignUpRequest r);    // r.role is customer|pharmacist; pharmacist requires r.storeName
Future<void> signIn(String email, String password);
Future<void> signInWithGoogle();         // opens browser; watchUser emits when the deep link returns
Future<void> resendConfirmation(String email);
Future<void> sendPasswordReset(String email);
Future<void> updatePassword(String newPassword);   // from the reset deep link
Future<void> signOut();                  // also clears all local data (cart, cache)
```
`AppUser`: id, email, fullName, avatarUrl, `role`, `isBanned`, `storeStatus` (pharmacists: pending/approved/rejected), `applicationDeclined`. **The router reads only this.**
Errors: `InvalidCredentialsException`, `EmailNotConfirmedException`, `EmailInUseException`, `WeakPasswordException`.

### CatalogRepository (read-only shop)
```dart
Future<Page<StoreCard>> searchStores(String query, {int page = 0});      // approved, not banned
Future<Store> getStore(String storeId);
Future<Page<ProductCard>> storeProducts(String storeId, {ProductFilter filter = const ProductFilter(), int page = 0});
Future<ProductDetail> getProduct(String productId);                     // images, variants, rating, store
Future<Page<Review>> productReviews(String productId, {int page = 0});
Future<List<Category>> categories();
```
`ProductFilter`: categoryId?, tier?, sort (newest / priceAsc / priceDesc / rating). Pages hold 20 items.
`ProductCard`: id, name, imageUrl, minPrice, maxPrice, bestTier, inStock, rating, reviewCount.
Cached in sqflite: store search results, store products, categories.

### CartRepository (local only)
```dart
Stream<Cart> watchCart();                       // lines grouped by Store, each with live price/stock/availability
Future<void> add(String variantId, {int qty = 1});   // adds to the existing line; caps at stock
Future<void> setQty(String variantId, int qty);       // qty 0 removes the line
Future<void> remove(String variantId);
```
`Cart`: `List<CartStoreGroup>` (store, lines, `OrderQuote` preview) + itemCount.
`CartLine`: variant, product name, image, unitPrice (current), qty, `availability` (ok / outOfStock / reducedStock(max) / unavailable).
Errors: `OutOfStockException` on `add`.

### CheckoutRepository
```dart
Future<CheckoutResult> placeOrder({
  required String checkoutId,      // generate once per tap (Uuid().v4()); reuse it on retry
  required String addressId,
  required String cardId,
});                                // reads the Cart itself; on success clears the Cart lines it ordered
Future<Money> shippingFee();       // current fee, for the preview
```
`CheckoutResult`: checkoutId, `List<Order>` (one per Store, with the database's totals).
Errors:
- `OutOfStockException(variantId)` and `UnavailableException(variantId)`: nothing is charged, and the Cart is left as it was.
- `CardDeclinedException`: test number `…0002`.
- `BannedException`.
- `OfflineException`: retrying with the **same** `checkoutId` is always safe.

### OrderRepository
```dart
Future<Page<Order>> list({OrderStatus? status, int page = 0});   // scoped by RLS to what this User may see
Future<OrderDetail> get(String orderId);       // items, address snapshot, card last4, timeline, reviewable items
Future<Order> cancel(String orderId);          // Customer before shipped, or Admin; restores stock
Future<Order> setStatus(String orderId, OrderStatus to);   // Pharmacist: next step only. Admin: any.
Future<void> review(String orderItemId, {required int rating, String? comment});   // delivered, once per item
```
Errors: `InvalidTransitionException`, `AlreadyReviewedException`, `PermissionException`.

### AccountRepository (Customer self-service)
```dart
Future<void> updateProfile({String? fullName, String? phone, File? avatar});
Future<List<Address>> addresses();
Future<Address> saveAddress(AddressInput a);        // create or update; isDefault unsets the others
Future<void> deleteAddress(String id);
Future<List<SavedCard>> cards();
Future<SavedCard> addCard(CardInput c);             // validates with CardValidator; stores brand + last4 + expiry only
Future<void> deleteCard(String id);
Future<void> setDefaultCard(String id);
Future<void> applyAsPharmacist(String storeName);   // only if the User has no Orders
```

### StoreManagementRepository (Pharmacist)
```dart
Future<Store> myStore();
Future<Store> updateStore({String? name, String? description, File? logo});
Future<Page<ManagedProduct>> myProducts({bool includeArchived = false, int page = 0});
Future<ManagedProduct> saveProduct(ProductInput p);
    // create or update in one call: fields, variants (add/edit/archive), new image files, removed images, order.
    // Rows are written first, then images; a failed upload throws PartialSaveException(product).
Future<void> archiveProduct(String productId);
Future<void> deleteProduct(String productId);   // throws HasOrdersException; archive instead
Future<Earnings> earnings();                    // subtotal of delivered orders + count
```

### AdminRepository
```dart
Future<List<Application>> pendingApplications();
Future<void> reviewApplication(String storeId, {required bool approve});
Future<Page<AdminUserRow>> users({String query = '', int page = 0});
Future<void> setBanned(String userId, bool banned);
Future<Page<ProductCard>> allProducts({String query = '', bool hiddenOnly = false, int page = 0});
Future<void> setProductHidden(String productId, bool hidden);
Future<Category> saveCategory(CategoryInput c);
Future<void> deleteCategory(String id);          // throws InUseException when Products use it
Future<void> setShippingFee(Money fee);
Future<AdminStats> stats();                      // platformRevenue, gmv, orderCount, pendingPharmacists
```
Order management for Admins goes through `OrderRepository`, where RLS gives them every Order.

## Shared types
- `Page<T>`: items, page, hasMore.
- `AppException` (sealed, each with `message`):
  - Offline, Auth* (the AuthRepository errors), Permission, Banned
  - OutOfStock(variantId), Unavailable(variantId), CardDeclined
  - InvalidTransition, AlreadyReviewed, HasOrders, InUse, PartialSave, Validation(field)
  - Unknown

## Providers (`lib/data/providers.dart`)
One provider per repository, plus `connectivityProvider` and `currentUserProvider` (from `watchUser`).

`main.dart` picks the adapters:
- `--dart-define=FAKE_DATA=true` uses every Fake. Frontend works this way until the backend is ready.
- Otherwise every Supabase adapter is used.

## Deliberately not interfaces
- **Image upload:** it's inside `saveProduct`, `updateStore` and `updateProfile`. No caller uploads on its own.
- **sqflite DAOs:** internal seams of `CatalogRepository` and `CartRepository`, tested through their repository.
- **Role checks in Dart:** the router reads `AppUser.role`, and the database enforces it. Repositories don't re-check.
