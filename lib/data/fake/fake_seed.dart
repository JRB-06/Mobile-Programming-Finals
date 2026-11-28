import '../../core/card_validator.dart';
import '../../core/money.dart';
import '../../core/order_status.dart';
import '../../models/account.dart';
import '../../models/app_user.dart';
import '../../models/category.dart';
import '../../models/inventory.dart';
import '../../models/order.dart';
import '../../models/pharmacist.dart';
import '../../models/product.dart';
import '../../models/review.dart';
import 'fake_store.dart';

/// Stable ids and logins of the seed fixtures.
///
/// The Supabase seed tool (#19) must create the same fixtures with the same
/// ids, so the repository contract suites run against both adapters.
///
/// Products 1..25 are the visible catalog (on active pharmacists, round
/// robin). Product 26 is archived; product 27 belongs to the archived
/// pharmacist. Product 4's only Blue Sky Variant is archived.
abstract final class SeedIds {
  static const password = 'Password123';

  // Users
  static const adminEmail = 'admin@pollos.test';
  static const customerEmail = 'customer@pollos.test';
  static const bannedEmail = 'banned@pollos.test';
  static const adminId = 'a0000000-0000-4000-8000-000000000001';
  static const customerId = 'a0000000-0000-4000-8000-000000000002';
  static const bannedId = 'a0000000-0000-4000-8000-000000000003';

  // Pharmacists: four active (in this order), one archived.
  static const pharmacistId = 'b0000000-0000-4000-8000-000000000001';
  static const pharmacistIds = [
    pharmacistId,
    'b0000000-0000-4000-8000-000000000002',
    'b0000000-0000-4000-8000-000000000003',
    'b0000000-0000-4000-8000-000000000004',
  ];
  static const archivedPharmacistId = 'b0000000-0000-4000-8000-000000000005';

  // Categories: the first two have products, the third has none.
  static const categoryId = 'c0000000-0000-4000-8000-000000000001';
  static const secondCategoryId = 'c0000000-0000-4000-8000-000000000002';
  static const unusedCategoryId = 'c0000000-0000-4000-8000-000000000003';

  /// Product ids for 1..27; the named ones below are the same strings.
  static String productId(int n) =>
      '10000000-0000-4000-8000-${n.toString().padLeft(12, '0')}';

  /// Product 1 (pharmacist 1): ordered (paid order), so it cannot be deleted.
  static const orderedProductId = '10000000-0000-4000-8000-000000000001';

  /// Product 4: pharma Variant plus an archived Blue Sky Variant.
  static const archivedBlueVariantProductId =
      '10000000-0000-4000-8000-000000000004';

  /// Product 7: its delivered order item is already reviewed (5 stars).
  static const reviewedProductId = '10000000-0000-4000-8000-000000000007';

  /// Product 25: never ordered, safe to delete.
  static const unorderedProductId = '10000000-0000-4000-8000-000000000025';

  /// Product 26: archived, on an active pharmacist.
  static const archivedProductId = '10000000-0000-4000-8000-000000000026';

  /// Product 27: on the archived pharmacist.
  static const archivedPharmacistProductId =
      '10000000-0000-4000-8000-000000000027';

  /// Product 28: every Variant is archived, so it is not shown.
  static const allVariantsArchivedProductId =
      '10000000-0000-4000-8000-000000000028';

  /// Product 8's item in the delivered order, reviewed (3 stars).
  static const secondReviewedItemId = '91000000-0000-4000-8000-000000000100';

  /// Names of 2, 9, 17, 26 and 27 contain "Blue"; 26 and 27 must never match.
  static const visibleProductCount = 25;

  // Variants
  /// Product 1, pharma, ₱450.00, stock 20.
  static const variant450Id = 'd1000000-0000-4000-8000-000000000001';

  /// Product 1, street, ₱120.00, stock 0.
  static const variantOutOfStockId = 'd1000000-0000-4000-8000-000000000002';

  /// Product 2 (pharmacist 2), street, ₱180.00, stock 20.
  static const variant180Id = 'd1000000-0000-4000-8000-000000000003';

  /// Product 2, pharma, ₱300.00, stock 3 (low stock).
  static const variantStock3Id = 'd1000000-0000-4000-8000-000000000004';

  /// Product 3, blueSky, ₱900.00, stock 30 (not low stock).
  static const variantStock30Id = 'd1000000-0000-4000-8000-000000000005';

  /// Product 4, blueSky, archived.
  static const archivedVariantId = 'd1000000-0000-4000-8000-000000000006';

  // Addresses and cards. The customer has two addresses (first is default)
  // and two cards (good one is default).
  static const customerAddressId = 'e0000000-0000-4000-8000-000000000001';
  static const customerSecondAddressId = 'e0000000-0000-4000-8000-000000000002';
  static const bannedAddressId = 'e0000000-0000-4000-8000-000000000003';
  static const goodCardId = 'f0000000-0000-4000-8000-000000000001';

  /// Visa ending 0002: placeOrder throws CardDeclinedException.
  static const declinedCardId = 'f0000000-0000-4000-8000-000000000002';
  static const bannedCardId = 'f0000000-0000-4000-8000-000000000003';

  // Orders, all the customer's. Totals include the 5000 shipping fee.
  /// paid: variant450 x1 + variant180 x1 (two pharmacists), total ₱680.00.
  static const paidOrderId = '90000000-0000-4000-8000-000000000001';

  /// shipped: product 5 variant x2.
  static const shippedOrderId = '90000000-0000-4000-8000-000000000002';

  /// delivered: product 6 item (unreviewed) and product 7 item (reviewed).
  static const deliveredOrderId = '90000000-0000-4000-8000-000000000003';

  /// cancelled: product 8 variant x1.
  static const cancelledOrderId = '90000000-0000-4000-8000-000000000004';
  static const unreviewedDeliveredItemId =
      '91000000-0000-4000-8000-000000000001';
  static const reviewedItemId = '91000000-0000-4000-8000-000000000002';
}

const _purities = [60.0, 90.0, 99.5]; // street, pharma, blueSky
const _names = [
  'Aurelia Cough Syrup', // 1
  'Blue Meridian Tonic', // 2
  'Cedar Fern Balm', // 3
  'Dawnpetal Drops', // 4
  'Ember Willow Tablets', // 5
  'Fernhollow Lozenges', // 6
  'Glimmerroot Capsules', // 7
  'Harbor Mist Spray', // 8
  'Blue Lantern Elixir', // 9
  'Ivory Thistle Salve', // 10
  'Juniper Vale Syrup', // 11
  'Kestrel Sage Tablets', // 12
  'Lumen Clover Drops', // 13
  'Moss Harbor Balm', // 14
  'Nimbus Reed Capsules', // 15
  'Opal Brook Lozenges', // 16
  'Blue Quill Tonic', // 17
  'Quartz Meadow Spray', // 18
  'Russet Fable Salve', // 19
  'Saffron Dune Syrup', // 20
  'Tidewick Tablets', // 21
  'Umber Glen Drops', // 22
  'Velvet Thorn Capsules', // 23
  'Willowmere Lozenges', // 24
  'Yarrow Peak Balm', // 25
  'Blue Hollow Drops', // 26 archived
  'Blue Ember Elixir', // 27 archived pharmacist
  'Dormant Hollow Salve', // 28 all variants archived
];

String _vid(int product, int k) =>
    'd0000000-0000-4000-8000-${(product * 10 + k).toString().padLeft(12, '0')}';

/// Fills an empty [s] with the fixtures described by [SeedIds].
void seedStore(FakeStore s) {
  void user(String id, String email, String name, UserRole role, bool banned) {
    s.users[id] = AppUser(
      id: id,
      email: email,
      fullName: name,
      role: role,
      isBanned: banned,
    );
    s.passwords[email] = SeedIds.password;
  }

  user(SeedIds.adminId, SeedIds.adminEmail, 'Ada Admin', UserRole.admin, false);
  user(
    SeedIds.customerId,
    SeedIds.customerEmail,
    'Cleo Customer',
    UserRole.customer,
    false,
  );
  user(
    SeedIds.bannedId,
    SeedIds.bannedEmail,
    'Bram Banned',
    UserRole.customer,
    true,
  );

  const specialties = [
    'Herbal remedies',
    'Respiratory care',
    'Skin care',
    'General practice',
    'Retired line',
  ];
  final pharmacistIds = [
    ...SeedIds.pharmacistIds,
    SeedIds.archivedPharmacistId,
  ];
  const pharmacistNames = [
    'Dr. Mira Vale',
    'Dr. Tobin Hale',
    'Dr. Sana Ortiz',
    'Dr. Pell Rowan',
    'Dr. Old Archive',
  ];
  for (var i = 0; i < 5; i++) {
    s.pharmacists[pharmacistIds[i]] = Pharmacist(
      id: pharmacistIds[i],
      name: pharmacistNames[i],
      photoUrl: 'https://picsum.photos/seed/pharmacist-${i + 1}/800/800',
      specialty: specialties[i],
      archived: i == 4,
    );
  }

  const categoryNames = ['Syrups and tonics', 'Tablets and capsules', 'Unused'];
  const categoryIds = [
    SeedIds.categoryId,
    SeedIds.secondCategoryId,
    SeedIds.unusedCategoryId,
  ];
  for (var i = 0; i < 3; i++) {
    s.categories[categoryIds[i]] = Category(
      id: categoryIds[i],
      name: categoryNames[i],
    );
  }

  for (var n = 1; n <= 28; n++) {
    final id = SeedIds.productId(n);
    s.products[id] = ManagedProduct(
      id: id,
      pharmacistId: n == 27
          ? SeedIds.archivedPharmacistId
          : SeedIds.pharmacistIds[(n - 1) % 4],
      categoryId: n.isEven ? SeedIds.secondCategoryId : SeedIds.categoryId,
      name: _names[n - 1],
      description: 'A fictional remedy for the demo shop.',
      archived: n == 26,
      images: ['https://picsum.photos/seed/pollos-$n/800/800'],
    );
  }

  void variant(
    String id,
    int product,
    num purity,
    String size,
    int pesos,
    int stock, {
    bool archived = false,
  }) {
    s.variants[id] = Variant(
      id: id,
      productId: SeedIds.productId(product),
      purity: purity,
      sizeLabel: size,
      price: Money(pesos * 100),
      stock: stock,
      archived: archived,
    );
  }

  variant(SeedIds.variant450Id, 1, 90.0, '100ml', 450, 20);
  variant(SeedIds.variantOutOfStockId, 1, 60.0, '50ml', 120, 0);
  variant(SeedIds.variant180Id, 2, 70.0, '50ml', 180, 20);
  variant(SeedIds.variantStock3Id, 2, 95.0, '100ml', 300, 3);
  variant(SeedIds.variantStock30Id, 3, 99.5, '100ml', 900, 30);
  variant(_vid(3, 1), 3, 60.0, '50ml', 150, 15);
  variant(_vid(4, 0), 4, 92.0, '50ml', 260, 15);
  variant(SeedIds.archivedVariantId, 4, 99.9, '100ml', 700, 15, archived: true);
  variant(_vid(28, 0), 28, 90.0, '50ml', 200, 10, archived: true);
  for (var n = 5; n <= 27; n++) {
    for (var k = 0; k < 2; k++) {
      variant(
        _vid(n, k),
        n,
        _purities[(n + k) % 3],
        k == 0 ? '50ml' : '100ml',
        100 + n * 10 + k * 60,
        10 + n,
      );
    }
  }

  void address(String id, String userId, String label, bool isDefault) {
    (s.addresses[userId] ??= []).add(
      Address(
        id: id,
        label: label,
        line1: '12 Sample Street',
        city: 'Quezon City',
        province: 'Metro Manila',
        postalCode: '1100',
        isDefault: isDefault,
      ),
    );
  }

  address(SeedIds.customerAddressId, SeedIds.customerId, 'Home', true);
  address(SeedIds.customerSecondAddressId, SeedIds.customerId, 'Work', false);
  address(SeedIds.bannedAddressId, SeedIds.bannedId, 'Home', true);

  void card(String id, String userId, String last4, bool isDefault) {
    (s.cards[userId] ??= []).add(
      SavedCard(
        id: id,
        brand: CardBrand.visa,
        last4: last4,
        expMonth: 12,
        expYear: 2030,
        isDefault: isDefault,
      ),
    );
  }

  card(SeedIds.goodCardId, SeedIds.customerId, '4242', true);
  card(SeedIds.declinedCardId, SeedIds.customerId, '0002', false);
  card(SeedIds.bannedCardId, SeedIds.bannedId, '4242', true);

  var itemSeq = 2;
  void order(
    String id,
    OrderStatus status,
    int day,
    List<(String?, String, int)> lines,
  ) {
    final createdAt = DateTime.utc(2026, 11, day);
    var subtotal = Money.zero;
    for (final (itemId, variantId, qty) in lines) {
      final v = s.variants[variantId]!;
      final p = s.products[v.productId]!;
      final iid =
          itemId ??
          '91000000-0000-4000-8000-${(++itemSeq).toString().padLeft(12, '0')}';
      s.orderItems[iid] = OrderItem(
        id: iid,
        orderId: id,
        variantId: variantId,
        productId: p.id,
        productName: p.name,
        pharmacistName: s.pharmacists[p.pharmacistId]!.name,
        variantLabel: v.label,
        unitPrice: v.price,
        qty: qty,
      );
      subtotal = subtotal + v.price * qty;
    }
    s.orders[id] = Order(
      id: id,
      customerId: SeedIds.customerId,
      status: status,
      subtotal: subtotal,
      shippingFee: s.shippingFee,
      total: subtotal + s.shippingFee,
      cardBrand: CardBrand.visa,
      cardLast4: '4242',
      createdAt: createdAt,
      statusUpdatedAt: status == OrderStatus.paid
          ? null
          : createdAt.add(const Duration(days: 1)),
    );
    s.orderAddresses[id] = s.addresses[SeedIds.customerId]!.first;
  }

  order(SeedIds.paidOrderId, OrderStatus.paid, 20, [
    (null, SeedIds.variant450Id, 1),
    (null, SeedIds.variant180Id, 1),
  ]);
  order(SeedIds.shippedOrderId, OrderStatus.shipped, 15, [
    (null, _vid(5, 0), 2),
  ]);
  order(SeedIds.deliveredOrderId, OrderStatus.delivered, 10, [
    (SeedIds.unreviewedDeliveredItemId, _vid(6, 0), 1),
    (SeedIds.reviewedItemId, _vid(7, 0), 1),
    (SeedIds.secondReviewedItemId, _vid(8, 0), 1),
  ]);
  order(SeedIds.cancelledOrderId, OrderStatus.cancelled, 5, [
    (null, _vid(8, 0), 1),
  ]);

  void review(
    String id,
    String product,
    int rating,
    String comment,
    String orderItemId,
  ) {
    s.reviews.add((
      review: Review(
        id: id,
        productId: product,
        rating: rating,
        comment: comment,
        reviewerName: 'Cleo Customer',
        createdAt: DateTime.utc(2026, 11, 12),
      ),
      orderItemId: orderItemId,
    ));
  }

  review(
    '80000000-0000-4000-8000-000000000001',
    SeedIds.reviewedProductId,
    5,
    'Works well.',
    SeedIds.reviewedItemId,
  );
  review(
    '80000000-0000-4000-8000-000000000002',
    SeedIds.productId(8),
    3,
    'Fine.',
    SeedIds.secondReviewedItemId,
  );
}
