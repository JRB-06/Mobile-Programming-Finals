import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/app_exception.dart';
import 'package:los_pollos_hermanos/core/order_status.dart';
import 'package:los_pollos_hermanos/data/fake/fake_seed.dart';

import 'contract_env.dart';

Future<int> _stock(ContractEnv env, String productId, String variantId) async =>
    (await env.catalog.getProduct(productId)).variants
        .firstWhere((v) => v.id == variantId)
        .stock;

/// OrderRepository behaviour every adapter must have.
void orderContract(EnvFactory makeEnv) {
  group('OrderRepository contract', () {
    test('a Customer lists only their own Orders, newest first', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final all = (await env.orders.list()).items;
      expect(all.every((o) => o.customerId == SeedIds.customerId), isTrue);
      expect(
        all.map((o) => o.id),
        containsAll([
          SeedIds.paidOrderId,
          SeedIds.shippedOrderId,
          SeedIds.deliveredOrderId,
          SeedIds.cancelledOrderId,
        ]),
      );
      for (var i = 1; i < all.length; i++) {
        expect(all[i - 1].createdAt.isBefore(all[i].createdAt), isFalse);
      }
      final shipped = await env.orders.list(status: OrderStatus.shipped);
      expect(
        shipped.items.every((o) => o.status == OrderStatus.shipped),
        isTrue,
      );
      expect(shipped.items.map((o) => o.id), contains(SeedIds.shippedOrderId));
    });

    test("a Customer's list never holds another user's Orders", () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.bannedEmail);
      final items = (await env.orders.list()).items;
      expect(items.every((o) => o.customerId == SeedIds.bannedId), isTrue);
      expect(items.map((o) => o.id), isNot(contains(SeedIds.paidOrderId)));
    });

    test('the Admin lists every Order', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      final ids = (await env.orders.list()).items.map((o) => o.id);
      expect(
        ids,
        containsAll([
          SeedIds.paidOrderId,
          SeedIds.shippedOrderId,
          SeedIds.deliveredOrderId,
          SeedIds.cancelledOrderId,
        ]),
      );
    });

    test(
      'get returns items, address, card, timeline, reviewable items',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.customerEmail);
        final d = await env.orders.get(SeedIds.deliveredOrderId);
        expect(d.items, hasLength(3));
        expect(d.items.every((i) => i.pharmacistName.isNotEmpty), isTrue);
        expect(d.shippingAddress, isNotNull);
        expect(d.order.cardLast4, '4242');
        expect(d.timeline, [
          OrderStatus.paid,
          OrderStatus.packed,
          OrderStatus.shipped,
          OrderStatus.delivered,
        ]);
        expect(d.reviewableItemIds, [SeedIds.unreviewedDeliveredItemId]);
        expect(d.customer, isNull);
        expect(
          (await env.orders.get(SeedIds.paidOrderId)).reviewableItemIds,
          isEmpty,
        );
      },
    );

    test(
      'the Admin sees the customer on get, with no reviewable items',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        final d = await env.orders.get(SeedIds.deliveredOrderId);
        expect(d.customer?.id, SeedIds.customerId);
        expect(d.reviewableItemIds, isEmpty);
      },
    );

    test("a Customer cannot get someone else's Order", () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.bannedEmail);
      await expectLater(
        env.orders.get(SeedIds.paidOrderId),
        throwsA(isA<PermissionException>()),
      );
    });

    test('a Customer cancels a paid Order and stock is restored', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final before = await _stock(
        env,
        SeedIds.orderedProductId,
        SeedIds.variant450Id,
      );
      final o = await env.orders.cancel(SeedIds.paidOrderId);
      expect(o.status, OrderStatus.cancelled);
      expect(
        await _stock(env, SeedIds.orderedProductId, SeedIds.variant450Id),
        before + 1,
      );
    });

    test("a Customer cannot cancel someone else's Order", () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.bannedEmail);
      await expectLater(
        env.orders.cancel(SeedIds.paidOrderId),
        throwsA(isA<PermissionException>()),
      );
    });

    test('a banned Customer can still cancel their own Order', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await env.admin.setBanned(SeedIds.customerId, true);
      await env.signInAs(SeedIds.customerEmail);
      final o = await env.orders.cancel(SeedIds.paidOrderId);
      expect(o.status, OrderStatus.cancelled);
    });

    test('a banned Customer cannot review', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await env.admin.setBanned(SeedIds.customerId, true);
      await env.signInAs(SeedIds.customerEmail);
      await expectLater(
        env.orders.review(SeedIds.unreviewedDeliveredItemId, rating: 5),
        throwsA(isA<BannedException>()),
      );
    });

    test('cancelling twice fails and restores stock only once', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final b450 = await _stock(
        env,
        SeedIds.orderedProductId,
        SeedIds.variant450Id,
      );
      final b180 = await _stock(
        env,
        SeedIds.productId(2),
        SeedIds.variant180Id,
      );
      await env.orders.cancel(SeedIds.paidOrderId);
      await expectLater(
        env.orders.cancel(SeedIds.paidOrderId),
        throwsA(isA<InvalidTransitionException>()),
      );
      expect(
        await _stock(env, SeedIds.orderedProductId, SeedIds.variant450Id),
        b450 + 1,
      );
      expect(
        await _stock(env, SeedIds.productId(2), SeedIds.variant180Id),
        b180 + 1,
      );
    });

    test('a cancelled Order has the timeline [paid, cancelled]', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      await env.orders.cancel(SeedIds.paidOrderId);
      final d = await env.orders.get(SeedIds.paidOrderId);
      expect(d.timeline, [OrderStatus.paid, OrderStatus.cancelled]);
    });

    test('a Customer cannot cancel a shipped Order', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      await expectLater(
        env.orders.cancel(SeedIds.shippedOrderId),
        throwsA(isA<InvalidTransitionException>()),
      );
    });

    test('the Admin cancels a shipped Order and stock is restored', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      final item = (await env.orders.get(SeedIds.shippedOrderId)).items.single;
      final before = await _stock(env, item.productId, item.variantId);
      final o = await env.orders.cancel(SeedIds.shippedOrderId);
      expect(o.status, OrderStatus.cancelled);
      expect(
        await _stock(env, item.productId, item.variantId),
        before + item.qty,
      );
    });

    test('nobody cancels a delivered or cancelled Order', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      for (final id in [SeedIds.deliveredOrderId, SeedIds.cancelledOrderId]) {
        await expectLater(
          env.orders.cancel(id),
          throwsA(isA<InvalidTransitionException>()),
        );
      }
    });

    test('advance as a Customer throws PermissionException', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      await expectLater(
        env.orders.advance(SeedIds.paidOrderId),
        throwsA(isA<PermissionException>()),
      );
    });

    test(
      'the Admin advances paid to packed, then through to delivered',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        for (final s in [
          OrderStatus.packed,
          OrderStatus.shipped,
          OrderStatus.delivered,
        ]) {
          expect((await env.orders.advance(SeedIds.paidOrderId)).status, s);
        }
        await expectLater(
          env.orders.advance(SeedIds.paidOrderId),
          throwsA(isA<InvalidTransitionException>()),
        );
      },
    );

    test(
      'advance out of cancelled throws InvalidTransitionException',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        await expectLater(
          env.orders.advance(SeedIds.cancelledOrderId),
          throwsA(isA<InvalidTransitionException>()),
        );
      },
    );

    test('review on a non-delivered item throws InvalidTransition', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final item = (await env.orders.get(SeedIds.shippedOrderId)).items.first;
      await expectLater(
        env.orders.review(item.id, rating: 5),
        throwsA(isA<InvalidTransitionException>()),
      );
    });

    test('a second review on the same item throws AlreadyReviewed', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      await expectLater(
        env.orders.review(SeedIds.reviewedItemId, rating: 4),
        throwsA(isA<AlreadyReviewedException>()),
      );
      await env.orders.review(
        SeedIds.unreviewedDeliveredItemId,
        rating: 4,
        comment: 'Good',
      );
      await expectLater(
        env.orders.review(SeedIds.unreviewedDeliveredItemId, rating: 4),
        throwsA(isA<AlreadyReviewedException>()),
      );
    });

    test(
      'a review is stored: catalog rating and reviewable items update',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.customerEmail);
        final productId = (await env.orders.get(SeedIds.deliveredOrderId)).items
            .firstWhere((i) => i.id == SeedIds.unreviewedDeliveredItemId)
            .productId;
        final before = await env.catalog.getProduct(productId);
        await env.orders.review(SeedIds.unreviewedDeliveredItemId, rating: 4);
        final p = await env.catalog.getProduct(productId);
        expect(p.reviewCount, before.reviewCount + 1);
        expect(
          p.rating,
          closeTo(
            (before.rating * before.reviewCount + 4) / (before.reviewCount + 1),
            0.1,
          ),
        );
        expect(
          (await env.orders.get(SeedIds.deliveredOrderId)).reviewableItemIds,
          isEmpty,
        );
      },
    );

    test('a rating outside 1..5 throws ValidationException', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      for (final r in [0, 6]) {
        await expectLater(
          env.orders.review(SeedIds.unreviewedDeliveredItemId, rating: r),
          throwsA(
            isA<ValidationException>().having(
              (e) => e.field,
              'field',
              'rating',
            ),
          ),
        );
      }
    });

    test('the Admin cannot review', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await expectLater(
        env.orders.review(SeedIds.unreviewedDeliveredItemId, rating: 5),
        throwsA(isA<PermissionException>()),
      );
    });

    test('signed out: PermissionException', () async {
      final env = await makeEnv();
      await expectLater(env.orders.list(), throwsA(isA<PermissionException>()));
    });
  });
}
