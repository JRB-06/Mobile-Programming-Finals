import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/app_exception.dart';
import 'package:los_pollos_hermanos/core/card_validator.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/core/order_status.dart';
import 'package:los_pollos_hermanos/core/tier.dart';
import 'package:los_pollos_hermanos/models/account.dart';
import 'package:los_pollos_hermanos/models/app_user.dart';
import 'package:los_pollos_hermanos/models/category.dart';
import 'package:los_pollos_hermanos/models/converters.dart';
import 'package:los_pollos_hermanos/models/admin.dart';
import 'package:los_pollos_hermanos/models/inventory.dart';
import 'package:los_pollos_hermanos/models/order.dart';
import 'package:los_pollos_hermanos/models/pharmacist.dart';
import 'package:los_pollos_hermanos/models/product.dart';
import 'package:los_pollos_hermanos/models/review.dart';

// Simulates sqflite: encode to a string and back.
Map<String, dynamic> _wire(Map<String, dynamic> j) =>
    jsonDecode(jsonEncode(j)) as Map<String, dynamic>;

void main() {
  const converter = MoneyConverter();

  final orderJson = {
    'id': 'o1',
    'customer_id': 'u1',
    'status': 'paid',
    'subtotal': '630.00',
    'shipping_fee': '50.00',
    'total': '680.00',
    'card_brand': 'visa',
    'card_last4': '4242',
    'created_at': '2026-11-28T10:00:00.000Z',
    'status_updated_at': '2026-11-28T10:00:00.000Z',
  };

  test('Order.fromJson reads numeric strings and enum names', () {
    final o = Order.fromJson(orderJson);
    expect(o.total, const Money(68000));
    expect(o.status, OrderStatus.paid);
    expect(o.cardBrand, CardBrand.visa);
  });

  test('MoneyConverter accepts Postgres numbers and writes exact strings', () {
    expect(converter.fromJson(680), const Money(68000));
    expect(converter.fromJson(680.5), const Money(68050));
    expect(converter.fromJson('680.00'), const Money(68000));
    expect(converter.toJson(const Money(68000)), '680.00');
    expect(converter.toJson(const Money(-5)), '-0.05');
  });

  test('Variant.fromJson derives the tier from purity', () {
    final v = Variant.fromJson({
      'id': 'v1',
      'product_id': 'p1',
      'purity': 99.1,
      'size_label': '100ml',
      'price': 680,
      'stock': 3,
      'archived': false,
    });
    expect(v.tier, Tier.blueSky);
    expect(v.label, '99.1% · 100ml');
  });

  test('toJson then fromJson round trips', () {
    final order = Order.fromJson(orderJson);
    expect(Order.fromJson(_wire(order.toJson())), order);

    const address = AddressInput(
      label: 'Home',
      line1: '1 Main St',
      city: 'Manila',
      province: 'NCR',
      postalCode: '1000',
    );
    expect(AddressInput.fromJson(_wire(address.toJson())), address);

    const card = ProductCard(
      id: 'p1',
      name: 'Paracetamol',
      imageUrl: 'https://x/y.png',
      categoryName: 'Pain',
      pharmacistId: 'ph1',
      pharmacistName: 'Walter',
      minPrice: Money(10000),
      maxPrice: Money(68000),
      bestTier: Tier.blueSky,
      inStock: true,
      rating: 4.5,
      reviewCount: 2,
    );
    expect(ProductCard.fromJson(_wire(card.toJson())), card);

    const pharmacist = Pharmacist(
      id: 'ph1',
      name: 'Walter',
      photoUrl: 'https://x/w.png',
      specialty: 'Chemistry',
    );
    expect(Pharmacist.fromJson(_wire(pharmacist.toJson())), pharmacist);

    const variant = Variant(
      id: 'v1',
      productId: 'p1',
      purity: 99.1,
      sizeLabel: '100ml',
      price: Money(68000),
      stock: 3,
    );
    expect(Variant.fromJson(_wire(variant.toJson())), variant);

    const saved = SavedCard(
      id: 'c1',
      brand: CardBrand.amex,
      last4: '0005',
      expMonth: 12,
      expYear: 2030,
    );
    expect(SavedCard.fromJson(_wire(saved.toJson())), saved);

    final managed = ManagedProduct(
      id: 'p1',
      pharmacistId: 'ph1',
      name: 'Paracetamol',
      description: 'd',
      variants: [variant],
      images: const ['a.png'],
    );
    expect(ManagedProduct.fromJson(_wire(managed.toJson())), managed);
  });

  test('Tier uses snake_case in JSON; image and category may be null', () {
    final c = ProductCard.fromJson({
      'id': 'p1',
      'name': 'N',
      'pharmacist_id': 'ph',
      'pharmacist_name': 'W',
      'min_price': '1.00',
      'max_price': 2,
      'best_tier': 'blue_sky',
      'in_stock': true,
    });
    expect(c.bestTier, Tier.blueSky);
    expect(c.imageUrl, isNull);
    expect(c.categoryName, isNull);
    expect(c.toJson()['best_tier'], 'blue_sky');
  });

  test('Input ids are omitted when null', () {
    const a = AddressInput(
      label: 'H',
      line1: 'l',
      city: 'c',
      province: 'p',
      postalCode: '1',
    );
    expect(a.toJson().containsKey('id'), isFalse);
    expect(a.copyWith(id: 'x').toJson()['id'], 'x');
    expect(const CategoryInput(name: 'n').toJson().containsKey('id'), isFalse);
    expect(
      const PharmacistInput(
        name: 'n',
        photoUrl: 'u',
      ).toJson().containsKey('id'),
      isFalse,
    );
  });

  test('CardInput.toString hides number and cvv', () {
    const c = CardInput(
      number: '4242424242424242',
      expMonth: 1,
      expYear: 2030,
      cvv: '123',
    );
    expect(c.toString(), isNot(contains('4242424242424242')));
    expect(c.toString(), isNot(contains('123')));
    expect(c.toString(), contains('4242'));
  });

  test('Variant.label always shows one decimal', () {
    const v = Variant(
      id: 'v',
      productId: 'p',
      purity: 80,
      sizeLabel: '100ml',
      price: Money(100),
      stock: 1,
    );
    expect(v.label, '80.0% · 100ml');
  });

  test('MoneyConverter rejects sub-centavo amounts', () {
    expect(() => converter.fromJson('1.005'), throwsFormatException);
  });

  test('more round trips: OrderDetail, ProductDetail, Dashboard, Review', () {
    final detail = OrderDetail(
      order: Order.fromJson(orderJson),
      items: const [
        OrderItem(
          id: 'i1',
          orderId: 'o1',
          variantId: 'v1',
          productId: 'p1',
          productName: 'P',
          pharmacistName: 'W',
          variantLabel: '99.1% · 100ml',
          unitPrice: Money(63000),
          qty: 1,
        ),
      ],
      shippingAddress: const Address(
        id: 'a1',
        label: 'Home',
        line1: 'l',
        city: 'c',
        province: 'p',
        postalCode: '1',
      ),
      timeline: const [OrderStatus.paid],
      reviewableItemIds: const ['i1'],
      customer: const CustomerRow(id: 'u1', fullName: 'J', email: 'j@x.com'),
    );
    expect(OrderDetail.fromJson(_wire(detail.toJson())), detail);

    const pd = ProductDetail(
      id: 'p1',
      name: 'N',
      pharmacistId: 'ph',
      pharmacistName: 'W',
      minPrice: Money(100),
      maxPrice: Money(200),
      bestTier: Tier.pharma,
      inStock: true,
      pharmacistPhotoUrl: 'u',
      images: ['a'],
      variants: [
        Variant(
          id: 'v',
          productId: 'p1',
          purity: 90,
          sizeLabel: 's',
          price: Money(100),
          stock: 2,
        ),
      ],
    );
    expect(ProductDetail.fromJson(_wire(pd.toJson())), pd);

    const dash = Dashboard(
      revenue: Money(123456),
      ordersByStatus: {OrderStatus.paid: 2, OrderStatus.cancelled: 1},
      customerCount: 3,
      lowStockCount: 4,
    );
    expect(Dashboard.fromJson(_wire(dash.toJson())), dash);

    final review = Review(
      id: 'r1',
      productId: 'p1',
      rating: 5,
      comment: 'ok',
      createdAt: DateTime.utc(2026, 11, 28),
    );
    expect(Review.fromJson(_wire(review.toJson())), review);
  });

  test('remaining models round trip', () {
    void rt<T>(
      T v,
      Map<String, dynamic> Function(T) to,
      T Function(Map<String, dynamic>) from,
    ) {
      expect(from(_wire(to(v))), v);
    }

    rt(
      const Category(id: 'c', name: 'Pain', icon: 'pill'),
      (v) => v.toJson(),
      Category.fromJson,
    );
    rt(
      const AppUser(
        id: 'u',
        email: 'a@b.c',
        fullName: 'A',
        phone: '1',
        role: UserRole.admin,
        isBanned: true,
      ),
      (v) => v.toJson(),
      AppUser.fromJson,
    );
    rt(
      const LowStockVariant(
        variantId: 'v',
        productId: 'p',
        productName: 'N',
        variantLabel: '99.0% · 1ml',
        stock: 2,
      ),
      (v) => v.toJson(),
      LowStockVariant.fromJson,
    );
    rt(
      const VariantInput(
        id: 'v',
        purity: 99.1,
        sizeLabel: 's',
        price: Money(1050),
        stock: 4,
      ),
      (v) => v.toJson(),
      VariantInput.fromJson,
    );
    rt(
      const CategoryInput(id: 'c', name: 'n', icon: 'i'),
      (v) => v.toJson(),
      CategoryInput.fromJson,
    );
    rt(
      const PharmacistInput(id: 'p', name: 'n', photoUrl: 'u', specialty: 's'),
      (v) => v.toJson(),
      PharmacistInput.fromJson,
    );
    rt(
      const ProductFilter(
        pharmacistId: 'p',
        categoryId: 'c',
        tier: Tier.blueSky,
        sort: ProductSort.priceDesc,
      ),
      (v) => v.toJson(),
      ProductFilter.fromJson,
    );
    rt(
      CustomerRow(
        id: 'u',
        fullName: 'J',
        email: 'j@x.c',
        phone: '1',
        isBanned: true,
        orderCount: 3,
        createdAt: DateTime.utc(2026, 1, 1),
      ),
      (v) => v.toJson(),
      CustomerRow.fromJson,
    );
    rt(
      const OrderItem(
        id: 'i',
        orderId: 'o',
        variantId: 'v',
        productId: 'p',
        productName: 'N',
        pharmacistName: 'W',
        variantLabel: 'l',
        unitPrice: Money(63000),
        qty: 2,
      ),
      (v) => v.toJson(),
      OrderItem.fromJson,
    );
  });

  test('every AppException has a message', () {
    final all = <AppException>[
      const OfflineException(),
      const InvalidCredentialsException(),
      const EmailNotConfirmedException(),
      const EmailInUseException(),
      const WeakPasswordException(),
      const PermissionException(),
      const BannedException(),
      const OutOfStockException('v1'),
      const UnavailableException('v1'),
      const CardDeclinedException(),
      const InvalidTransitionException(),
      const AlreadyReviewedException(),
      const HasOrdersException(),
      const InUseException(),
      const PartialSaveException(
        ManagedProduct(id: 'p', pharmacistId: 'ph', name: 'n', description: ''),
      ),
      const ValidationException('email', 'Enter an email'),
      const UnknownException('boom'),
    ];
    for (final e in all) {
      // Exhaustive switch: adding a subclass without a case fails to compile.
      final kind = switch (e) {
        OfflineException() ||
        InvalidCredentialsException() ||
        EmailNotConfirmedException() ||
        EmailInUseException() ||
        WeakPasswordException() ||
        PermissionException() ||
        BannedException() ||
        OutOfStockException() ||
        UnavailableException() ||
        CardDeclinedException() ||
        InvalidTransitionException() ||
        AlreadyReviewedException() ||
        HasOrdersException() ||
        InUseException() ||
        PartialSaveException() ||
        ValidationException() ||
        UnknownException() => e.runtimeType,
      };
      expect(e.message, isNotEmpty, reason: '$kind');
      expect(e.toString(), e.message);
    }
    expect(const ValidationException('f', 'Bad').message, 'Bad');
  });
}
