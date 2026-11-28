import '../../core/app_exception.dart';
import '../../core/order_math.dart';
import '../../models/cart.dart';
import '../repositories.dart';
import 'fake_store.dart';

/// Behaviour notes:
/// - The Cart is global (not per user), like the sqflite cart.
/// - [add] with qty < 1 and [setQty] with qty < 0 throw [ValidationException]
///   on 'qty'.
/// - [add] and [setQty] cap at current stock. [add] of an out-of-stock Variant
///   throws [OutOfStockException]; of an archived or unknown one,
///   [UnavailableException].
/// - A line is unavailable when its Variant, Product or Pharmacist is archived,
///   outOfStock at stock 0, reducedStock(stock) when qty exceeds stock.
class FakeCartRepository implements CartRepository {
  FakeCartRepository(this.store);

  final FakeStore store;

  @override
  Stream<Cart> watchCart() => store.watch(_read);

  @override
  Future<void> add(String variantId, {int qty = 1}) async {
    await store.delay();
    if (qty < 1) {
      throw const ValidationException('qty', 'Quantity must be at least 1.');
    }
    final v = store.variants[variantId];
    if (v == null || !store.isSellable(v)) {
      throw UnavailableException(variantId);
    }
    if (v.stock <= 0) throw OutOfStockException(variantId);
    final want = (store.cartLines[variantId] ?? 0) + qty;
    store.cartLines[variantId] = want > v.stock ? v.stock : want;
    store.notify();
  }

  @override
  Future<void> setQty(String variantId, int qty) async {
    await store.delay();
    if (qty < 0) {
      throw const ValidationException('qty', 'Quantity cannot be negative.');
    }
    final v = store.variants[variantId];
    if (qty == 0 || v == null) {
      store.cartLines.remove(variantId);
    } else if (store.cartLines.containsKey(variantId)) {
      store.cartLines[variantId] = qty > v.stock && v.stock > 0 ? v.stock : qty;
    }
    store.notify();
  }

  @override
  Future<void> remove(String variantId) async {
    await store.delay();
    store.cartLines.remove(variantId);
    store.notify();
  }

  Cart _read() {
    final lines = <CartLine>[];
    for (final e in store.cartLines.entries) {
      final v = store.variants[e.key];
      if (v == null) continue;
      final p = store.products[v.productId]!;
      final LineAvailability availability = !store.isSellable(v)
          ? const LineAvailability.unavailable()
          : v.stock <= 0
          ? const LineAvailability.outOfStock()
          : e.value > v.stock
          ? LineAvailability.reducedStock(v.stock)
          : const LineAvailability.ok();
      lines.add(
        CartLine(
          variantId: v.id,
          productId: p.id,
          productName: p.name,
          pharmacistName: store.pharmacists[p.pharmacistId]!.name,
          variantLabel: v.label,
          tier: v.tier,
          imageUrl: p.images.firstOrNull,
          unitPrice: v.price,
          qty: e.value,
          availability: availability,
        ),
      );
    }
    return Cart(
      lines: lines,
      quote: quoteOrder(
        lines: [
          for (final l in lines)
            if (l.availability is LineOk)
              QuoteLine(unitPrice: l.unitPrice, qty: l.qty),
        ],
        shippingFee: store.shippingFee,
      ),
    );
  }
}
