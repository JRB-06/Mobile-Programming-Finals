import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/app_exception.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/data/fake/fake_seed.dart';
import 'package:los_pollos_hermanos/models/cart.dart';
import 'package:los_pollos_hermanos/models/inventory.dart';

import 'contract_env.dart';

/// A fresh environment with the seed customer signed in.
Future<ContractEnv> customerEnv(EnvFactory makeEnv) async {
  final env = await makeEnv();
  await env.signInAs(SeedIds.customerEmail);
  return env;
}

/// As an Admin, changes [stock] and/or [price] of one Variant of product
/// [productN], then signs the customer back in.
Future<void> editVariant(
  ContractEnv env,
  int productN,
  String variantId, {
  int? stock,
  Money? price,
}) async {
  await env.signInAs(SeedIds.adminEmail);
  final product = await env.inventory.getProduct(SeedIds.productId(productN));
  await env.inventory.saveProduct(
    ProductInput(
      id: product.id,
      pharmacistId: product.pharmacistId,
      categoryId: product.categoryId,
      name: product.name,
      description: product.description,
      variants: [
        for (final v in product.variants)
          VariantInput(
            id: v.id,
            purity: v.purity,
            sizeLabel: v.sizeLabel,
            price: v.id == variantId ? price ?? v.price : v.price,
            stock: v.id == variantId ? stock ?? v.stock : v.stock,
            archived: v.archived,
          ),
      ],
      imageOrder: product.images,
    ),
  );
  await env.signInAs(SeedIds.customerEmail);
}

/// As an Admin, archives product [productN], then signs the customer back in.
Future<void> archiveProduct(ContractEnv env, int productN) async {
  await env.signInAs(SeedIds.adminEmail);
  await env.inventory.setArchived(SeedIds.productId(productN), true);
  await env.signInAs(SeedIds.customerEmail);
}

/// CartRepository behaviour every adapter must have.
void cartContract(EnvFactory makeEnv) {
  group('CartRepository contract', () {
    test('add of an out-of-stock variant throws OutOfStock', () async {
      final c = (await customerEnv(makeEnv)).cart;
      await expectLater(
        c.add(SeedIds.variantOutOfStockId),
        throwsA(
          isA<OutOfStockException>().having(
            (e) => e.variantId,
            'variantId',
            SeedIds.variantOutOfStockId,
          ),
        ),
      );
      expect((await c.watchCart().first).lines, isEmpty);
    });

    test('add adds to the existing line and caps at stock', () async {
      final c = (await customerEnv(makeEnv)).cart;
      await c.add(SeedIds.variantStock3Id);
      await c.add(SeedIds.variantStock3Id, qty: 2);
      expect((await c.watchCart().first).lines.single.qty, 3);
      await c.add(SeedIds.variantStock3Id, qty: 5);
      final cart = await c.watchCart().first;
      expect(cart.lines.single.qty, 3);
      expect(cart.itemCount, 3);
    });

    test('add with qty below 1 and setQty below 0 throw Validation', () async {
      final c = (await customerEnv(makeEnv)).cart;
      await expectLater(
        c.add(SeedIds.variant450Id, qty: 0),
        throwsA(isA<ValidationException>()),
      );
      await expectLater(
        c.add(SeedIds.variant450Id, qty: -1),
        throwsA(isA<ValidationException>()),
      );
      await c.add(SeedIds.variant450Id);
      await expectLater(
        c.setQty(SeedIds.variant450Id, -1),
        throwsA(isA<ValidationException>()),
      );
      expect((await c.watchCart().first).lines.single.qty, 1);
    });

    test('setQty changes qty (capped) and 0 removes the line', () async {
      final c = (await customerEnv(makeEnv)).cart;
      await c.add(SeedIds.variantStock3Id);
      await c.setQty(SeedIds.variantStock3Id, 2);
      expect((await c.watchCart().first).lines.single.qty, 2);
      await c.setQty(SeedIds.variantStock3Id, 99);
      expect((await c.watchCart().first).lines.single.qty, 3);
      await c.setQty(SeedIds.variantStock3Id, 0);
      expect((await c.watchCart().first).lines, isEmpty);
    });

    test('remove deletes the line', () async {
      final c = (await customerEnv(makeEnv)).cart;
      await c.add(SeedIds.variant450Id);
      await c.remove(SeedIds.variant450Id);
      expect((await c.watchCart().first).lines, isEmpty);
    });

    test('quote of 450 + 180 is subtotal 63000, total 68000', () async {
      final c = (await customerEnv(makeEnv)).cart;
      await c.add(SeedIds.variant450Id);
      await c.add(SeedIds.variant180Id);
      final cart = await c.watchCart().first;
      expect(cart.quote.subtotal, const Money(63000));
      expect(cart.quote.shippingFee, const Money(5000));
      expect(cart.quote.total, const Money(68000));
      expect(cart.itemCount, 2);
      expect(cart.canCheckout, isTrue);
      expect(cart.lines.every((l) => l.pharmacistName.isNotEmpty), isTrue);
      expect(cart.lines.every((l) => l.availability is LineOk), isTrue);
    });

    test('empty cart cannot check out and quotes zero', () async {
      final cart = await (await customerEnv(makeEnv)).cart.watchCart().first;
      expect(cart.canCheckout, isFalse);
      expect(cart.quote.total, Money.zero);
    });

    test('watchCart re-emits after a change', () async {
      final c = (await customerEnv(makeEnv)).cart;
      final carts = <Cart>[];
      final sub = c.watchCart().listen(carts.add);
      await pumpEventQueue();
      await c.add(SeedIds.variant450Id);
      await pumpEventQueue();
      await sub.cancel();
      expect(carts.first.lines, isEmpty);
      expect(carts.last.lines.single.variantId, SeedIds.variant450Id);
    });

    test('archived product shows unavailable and leaves the quote', () async {
      final env = await customerEnv(makeEnv);
      await env.cart.add(SeedIds.variant450Id);
      await env.cart.add(SeedIds.variant180Id);
      await archiveProduct(env, 2);
      final cart = await env.cart.watchCart().first;
      final line = cart.lines.firstWhere(
        (l) => l.variantId == SeedIds.variant180Id,
      );
      expect(line.availability, isA<LineUnavailable>());
      expect(cart.quote.subtotal, const Money(45000));
      expect(cart.canCheckout, isFalse);
    });

    test('reducedStock shown when stock drops below the cart qty', () async {
      final env = await customerEnv(makeEnv);
      await env.cart.add(SeedIds.variant450Id, qty: 3);
      await editVariant(env, 1, SeedIds.variant450Id, stock: 2);
      final line = (await env.cart.watchCart().first).lines.single;
      expect(line.availability, isA<LineReducedStock>());
      expect((line.availability as LineReducedStock).max, 2);
    });
  });
}
