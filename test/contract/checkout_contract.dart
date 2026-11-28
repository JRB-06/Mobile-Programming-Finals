import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/app_exception.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/core/order_status.dart';
import 'package:los_pollos_hermanos/data/fake/fake_seed.dart';
import 'package:los_pollos_hermanos/models/order.dart';
import 'package:uuid/uuid.dart';

import 'cart_contract.dart';
import 'contract_env.dart';

const _p1 = 1; // product of variant450
const _p2 = 2; // product of variant180

Future<int> _stock(ContractEnv env, int productN, String variantId) async {
  final p = await env.catalog.getProduct(SeedIds.productId(productN));
  return p.variants.firstWhere((v) => v.id == variantId).stock;
}

Future<ContractEnv> _envWithCart(EnvFactory makeEnv) async {
  final env = await customerEnv(makeEnv);
  await env.cart.add(SeedIds.variant450Id);
  await env.cart.add(SeedIds.variant180Id);
  return env;
}

Future<Order> _place(
  ContractEnv env,
  String orderId, {
  String cardId = SeedIds.goodCardId,
}) => env.checkout.placeOrder(
  orderId: orderId,
  addressId: SeedIds.customerAddressId,
  cardId: cardId,
);

/// CheckoutRepository behaviour every adapter must have.
void checkoutContract(EnvFactory makeEnv) {
  group('CheckoutRepository contract', () {
    final newId = const Uuid().v4;

    test('shippingFee is the current fee', () async {
      final env = await customerEnv(makeEnv);
      expect(await env.checkout.shippingFee(), const Money(5000));
      await env.signInAs(SeedIds.adminEmail);
      await env.admin.setShippingFee(const Money(7000));
      expect(await env.checkout.shippingFee(), const Money(7000));
    });

    test('placeOrder makes one paid Order across two pharmacists', () async {
      final env = await _envWithCart(makeEnv);
      final before1 = await _stock(env, _p1, SeedIds.variant450Id);
      final before2 = await _stock(env, _p2, SeedIds.variant180Id);
      final id = newId();
      final order = await _place(env, id);
      expect(order.id, id);
      expect(order.status, OrderStatus.paid);
      expect(order.subtotal, const Money(63000));
      expect(order.shippingFee, const Money(5000));
      expect(order.total, const Money(68000));
      expect(order.cardLast4, '4242');
      expect(await _stock(env, _p1, SeedIds.variant450Id), before1 - 1);
      expect(await _stock(env, _p2, SeedIds.variant180Id), before2 - 1);
      expect((await env.cart.watchCart().first).lines, isEmpty);
      final detail = await env.orders.get(id);
      expect(detail.items, hasLength(2));
      expect(detail.items.every((i) => i.pharmacistName.isNotEmpty), isTrue);
      expect(detail.items.map((i) => i.pharmacistName).toSet(), hasLength(2));
      expect(detail.shippingAddress?.id, SeedIds.customerAddressId);
    });

    test('replay returns the same Order, stock drops once, order lines leave the cart', () async {
      final env = await _envWithCart(makeEnv);
      final before = await _stock(env, _p1, SeedIds.variant450Id);
      final id = newId();
      final first = await _place(env, id);
      await env.cart.add(SeedIds.variant450Id); // in the order
      await env.cart.add(SeedIds.variantStock30Id); // not in the order
      final second = await _place(env, id);
      expect(second, first);
      expect(await _stock(env, _p1, SeedIds.variant450Id), before - 1);
      final cart = await env.cart.watchCart().first;
      expect(cart.lines.map((l) => l.variantId), [SeedIds.variantStock30Id]);
    });

    test('declined card throws and changes nothing', () async {
      final env = await _envWithCart(makeEnv);
      final before = await _stock(env, _p1, SeedIds.variant450Id);
      await expectLater(
        _place(env, newId(), cardId: SeedIds.declinedCardId),
        throwsA(isA<CardDeclinedException>()),
      );
      expect(await _stock(env, _p1, SeedIds.variant450Id), before);
      expect((await env.cart.watchCart().first).lines, hasLength(2));
    });

    test('banned customer gets BannedException', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.bannedEmail);
      await env.cart.add(SeedIds.variant450Id);
      final before = await _stock(env, _p1, SeedIds.variant450Id);
      await expectLater(
        env.checkout.placeOrder(
          orderId: newId(),
          addressId: SeedIds.bannedAddressId,
          cardId: SeedIds.bannedCardId,
        ),
        throwsA(isA<BannedException>()),
      );
      expect(await _stock(env, _p1, SeedIds.variant450Id), before);
    });

    test('single archived line throws Unavailable, nothing charged', () async {
      final env = await customerEnv(makeEnv);
      await env.cart.add(SeedIds.variant180Id);
      final before = await _stock(env, _p2, SeedIds.variant180Id);
      await archiveProduct(env, _p2);
      await expectLater(
        _place(env, newId()),
        throwsA(
          isA<UnavailableException>().having(
            (e) => e.variantId,
            'variantId',
            SeedIds.variant180Id,
          ),
        ),
      );
      expect((await env.cart.watchCart().first).lines, hasLength(1));
      await env.signInAs(SeedIds.adminEmail);
      final product = await env.inventory.getProduct(SeedIds.productId(_p2));
      expect(
        product.variants.firstWhere((v) => v.id == SeedIds.variant180Id).stock,
        before,
      );
    });

    test(
      'archived line in a two-line cart leaves the other untouched',
      () async {
        final env = await _envWithCart(makeEnv);
        final before = await _stock(env, _p1, SeedIds.variant450Id);
        await archiveProduct(env, _p2);
        await expectLater(
          _place(env, newId()),
          throwsA(isA<UnavailableException>()),
        );
        expect(await _stock(env, _p1, SeedIds.variant450Id), before);
        expect((await env.cart.watchCart().first).lines, hasLength(2));
      },
    );

    test('empty cart throws ValidationException', () async {
      final env = await customerEnv(makeEnv);
      await expectLater(
        _place(env, newId()),
        throwsA(isA<ValidationException>()),
      );
    });

    // The adapter must check the session before anything else; the Cart's
    // contents do not matter here (signOut clears the Cart).
    test('signed out throws PermissionException', () async {
      final env = await makeEnv();
      await expectLater(
        _place(env, newId()),
        throwsA(isA<PermissionException>()),
      );
    });

    test('qty above stock throws OutOfStock, nothing changes', () async {
      final env = await customerEnv(makeEnv);
      await env.cart.add(SeedIds.variant450Id, qty: 3);
      await editVariant(env, _p1, SeedIds.variant450Id, stock: 2);
      await expectLater(
        _place(env, newId()),
        throwsA(
          isA<OutOfStockException>().having(
            (e) => e.variantId,
            'variantId',
            SeedIds.variant450Id,
          ),
        ),
      );
      expect(await _stock(env, _p1, SeedIds.variant450Id), 2);
      expect((await env.cart.watchCart().first).lines.first.qty, 3);
    });

    test(
      'out-of-stock second line leaves the first line stock untouched',
      () async {
        final env = await customerEnv(makeEnv);
        await env.cart.add(SeedIds.variant450Id);
        await env.cart.add(SeedIds.variant180Id, qty: 2);
        await editVariant(env, _p2, SeedIds.variant180Id, stock: 1);
        final before = await _stock(env, _p1, SeedIds.variant450Id);
        await expectLater(
          _place(env, newId()),
          throwsA(
            isA<OutOfStockException>().having(
              (e) => e.variantId,
              'variantId',
              SeedIds.variant180Id,
            ),
          ),
        );
        expect(await _stock(env, _p1, SeedIds.variant450Id), before);
        expect((await env.cart.watchCart().first).lines, hasLength(2));
      },
    );

    test('a repriced variant is sold at the new price', () async {
      final env = await customerEnv(makeEnv);
      await env.cart.add(SeedIds.variant450Id);
      await editVariant(
        env,
        _p1,
        SeedIds.variant450Id,
        price: const Money(50000),
      );
      final id = newId();
      final order = await _place(env, id);
      expect(order.subtotal, const Money(50000));
      expect(order.total, const Money(55000));
      final detail = await env.orders.get(id);
      expect(detail.items.single.unitPrice, const Money(50000));
    });

    test('the Order keeps its shipping fee after the fee changes', () async {
      final env = await _envWithCart(makeEnv);
      final id = newId();
      await _place(env, id);
      await env.signInAs(SeedIds.adminEmail);
      await env.admin.setShippingFee(const Money(9000));
      await env.signInAs(SeedIds.customerEmail);
      final order = (await env.orders.get(id)).order;
      expect(order.shippingFee, const Money(5000));
      expect(order.total, const Money(68000));
    });
  });
}
