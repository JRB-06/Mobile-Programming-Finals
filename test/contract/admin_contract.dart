import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/app_exception.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/core/order_status.dart';
import 'package:los_pollos_hermanos/data/fake/fake_seed.dart';
import 'package:uuid/uuid.dart';

import 'contract_env.dart';

/// AdminRepository behaviour every adapter must have (Admin only).
void adminContract(EnvFactory makeEnv) {
  group('AdminRepository contract', () {
    test(
      'customers lists Customers only, with order counts and ban flags',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        final ids = (await env.admin.customers()).items.map((c) => c.id);
        expect(ids, containsAll([SeedIds.customerId, SeedIds.bannedId]));
        expect(ids, isNot(contains(SeedIds.adminId)));

        final cleo = (await env.admin.customers(query: 'cleo')).items;
        expect(cleo.map((c) => c.id), unorderedEquals([SeedIds.customerId]));
        // Seed-dependent: the Supabase seed (#19) must match the Fake seed.
        expect(cleo.single.orderCount, 4);

        final bram = (await env.admin.customers(query: 'bram')).items.single;
        expect(bram.isBanned, isTrue);
      },
    );

    test(
      'setBanned flags the Customer at sign-in, and can be undone',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        await env.admin.setBanned(SeedIds.customerId, true);
        await env.signInAs(SeedIds.customerEmail);
        expect((await env.auth.watchUser().first)?.isBanned, isTrue);

        await env.signInAs(SeedIds.adminEmail);
        await env.admin.setBanned(SeedIds.customerId, false);
        await env.signInAs(SeedIds.customerEmail);
        expect((await env.auth.watchUser().first)?.isBanned, isFalse);
      },
    );

    test('setBanned refuses to ban an admin', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await expectLater(
        env.admin.setBanned(SeedIds.adminId, true),
        throwsA(isA<PermissionException>()),
      );
      expect((await env.auth.watchUser().first)?.isBanned, isFalse);
    });

    test('setShippingFee changes the fee checkout quotes', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await env.admin.setShippingFee(const Money(7500));
      expect(await env.checkout.shippingFee(), const Money(7500));
    });

    test('setShippingFee rejects a negative fee', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await expectLater(
        env.admin.setShippingFee(const Money(-1)),
        throwsA(isA<ValidationException>()),
      );
    });

    test('an order placed after setShippingFee carries the new fee', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await env.admin.setShippingFee(const Money(7500));
      await env.signInAs(SeedIds.customerEmail);
      await env.cart.add(SeedIds.variant450Id);
      final order = await env.checkout.placeOrder(
        orderId: const Uuid().v4(),
        addressId: SeedIds.customerAddressId,
        cardId: SeedIds.goodCardId,
      );
      expect(order.shippingFee, const Money(7500));
      // Variant 450 is 450.00, so the total is 450.00 + 75.00.
      expect(order.total, const Money(45000 + 7500));
    });

    test('dashboard revenue sums delivered orders only', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      final d = await env.admin.dashboard();
      // Seed-dependent: the Supabase seed (#19) must match the Fake seed.
      // The only delivered order is 160.00 + 170.00 + 180.00 + 50.00 shipping.
      expect(d.revenue, const Money(56000));
      expect(d.ordersByStatus, {
        OrderStatus.paid: 1,
        OrderStatus.packed: 0,
        OrderStatus.shipped: 1,
        OrderStatus.delivered: 1,
        OrderStatus.cancelled: 1,
      });
      expect(d.lowStockCount, 2);
    });

    test('customerCount grows by one when a Customer signs up', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      final before = (await env.admin.dashboard()).customerCount;
      await env.auth.signOut();
      await env.auth.signUp(
        fullName: 'New Person',
        email: 'new.${DateTime.now().microsecondsSinceEpoch}@pollos.test',
        password: SeedIds.password,
      );
      await env.signInAs(SeedIds.adminEmail);
      expect((await env.admin.dashboard()).customerCount, before + 1);
    });

    test(
      'a Customer gets PermissionException from every admin method',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.customerEmail);
        final feeBefore = await env.checkout.shippingFee();
        final calls = <String, Future<Object?> Function()>{
          'customers': () => env.admin.customers(),
          'setBanned': () => env.admin.setBanned(SeedIds.bannedId, false),
          'setShippingFee': () => env.admin.setShippingFee(const Money(1)),
          'dashboard': () => env.admin.dashboard(),
        };
        for (final e in calls.entries) {
          await expectLater(
            e.value(),
            throwsA(isA<PermissionException>()),
            reason: e.key,
          );
        }
        expect(await env.checkout.shippingFee(), feeBefore);
      },
    );
  });
}
