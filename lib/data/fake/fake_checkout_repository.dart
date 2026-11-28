import 'package:uuid/uuid.dart';

import '../../core/app_exception.dart';
import '../../core/money.dart';
import '../../core/order_math.dart';
import '../../core/order_status.dart';
import '../../models/order.dart';
import '../repositories.dart';
import 'fake_store.dart';

/// Behaviour notes (checks run in this order, like the real place_order):
/// signed in; [orderId] already placed by this user (returns that Order
/// untouched and drops that order's variants from the Cart, so a retry after a
/// timeout clears the Cart); not banned; non-empty Cart
/// ([ValidationException] on 'cart'); per line, in Cart order, unavailable
/// ([UnavailableException]) then qty above stock ([OutOfStockException]); address and card
/// belong to the user ([ValidationException] on 'address'/'card'); card not
/// ending 0002. On any error nothing changes. On success the whole Cart is
/// ordered at current prices and the current shipping fee, which stay fixed on
/// the Order. A real adapter must check the session before anything else.
class FakeCheckoutRepository implements CheckoutRepository {
  FakeCheckoutRepository(this.store);

  final FakeStore store;

  @override
  Future<Money> shippingFee() async {
    await store.delay();
    return store.shippingFee;
  }

  @override
  Future<Order> placeOrder({
    required String orderId,
    required String addressId,
    required String cardId,
  }) async {
    await store.delay();
    final user = store.requireUser();

    final existing = store.orders[orderId];
    if (existing != null) {
      if (existing.customerId != user.id) throw const PermissionException();
      final ordered = {
        for (final i in store.orderItems.values)
          if (i.orderId == orderId) i.variantId,
      };
      if (store.cartLines.keys.any(ordered.contains)) {
        store.cartLines.removeWhere((id, _) => ordered.contains(id));
        store.notify();
      }
      return existing;
    }

    if (user.isBanned) throw const BannedException();
    if (store.cartLines.isEmpty) {
      throw const ValidationException('cart', 'Your cart is empty.');
    }
    for (final MapEntry(key: id, value: qty) in store.cartLines.entries) {
      final v = store.variants[id];
      if (v == null || !store.isSellable(v)) throw UnavailableException(id);
      if (qty > v.stock) throw OutOfStockException(id);
    }
    final address = store.addresses[user.id]
        ?.where((a) => a.id == addressId)
        .firstOrNull;
    if (address == null) {
      throw const ValidationException('address', 'Choose a delivery address.');
    }
    final card = store.cards[user.id]?.where((c) => c.id == cardId).firstOrNull;
    if (card == null) {
      throw const ValidationException('card', 'Choose a payment card.');
    }
    if (card.last4 == '0002') throw const CardDeclinedException();

    final lines = store.cartLines.entries.toList();
    final quote = quoteOrder(
      lines: [
        for (final l in lines)
          QuoteLine(unitPrice: store.variants[l.key]!.price, qty: l.value),
      ],
      shippingFee: store.shippingFee,
    );
    for (final MapEntry(key: id, value: qty) in lines) {
      final v = store.variants[id]!;
      final p = store.products[v.productId]!;
      store.variants[id] = v.copyWith(stock: v.stock - qty);
      final itemId = const Uuid().v4();
      store.orderItems[itemId] = OrderItem(
        id: itemId,
        orderId: orderId,
        variantId: id,
        productId: p.id,
        productName: p.name,
        pharmacistName: store.pharmacists[p.pharmacistId]!.name,
        variantLabel: v.label,
        unitPrice: v.price,
        qty: qty,
      );
      store.cartLines.remove(id);
    }
    final order = Order(
      id: orderId,
      customerId: user.id,
      status: OrderStatus.paid,
      subtotal: quote.subtotal,
      shippingFee: quote.shippingFee,
      total: quote.total,
      cardBrand: card.brand,
      cardLast4: card.last4,
      createdAt: DateTime.now().toUtc(),
    );
    store.orders[orderId] = order;
    store.orderAddresses[orderId] = address;
    store.notify();
    return order;
  }
}
