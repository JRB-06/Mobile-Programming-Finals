import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/core/order_math.dart';
import 'package:los_pollos_hermanos/core/tier.dart';

part 'cart.freezed.dart';

// Computed from sqflite + live catalog, never persisted or sent as JSON.
@freezed
sealed class LineAvailability with _$LineAvailability {
  const factory LineAvailability.ok() = LineOk;
  const factory LineAvailability.outOfStock() = LineOutOfStock;
  const factory LineAvailability.reducedStock(int max) = LineReducedStock;
  const factory LineAvailability.unavailable() = LineUnavailable;
}

@freezed
abstract class CartLine with _$CartLine {
  const factory CartLine({
    required String variantId,
    required String productId,
    required String productName,
    required String pharmacistName,
    required String variantLabel,
    required Tier tier,
    String? imageUrl,
    required Money unitPrice,
    required int qty,
    @Default(LineAvailability.ok()) LineAvailability availability,
  }) = _CartLine;
}

@freezed
abstract class Cart with _$Cart {
  const Cart._();

  /// [quote] already excludes lines with problems.
  const factory Cart({
    @Default(<CartLine>[]) List<CartLine> lines,
    required OrderQuote quote,
  }) = _Cart;

  int get itemCount => lines.fold(0, (n, l) => n + l.qty);

  bool get canCheckout =>
      lines.isNotEmpty && lines.every((l) => l.availability is LineOk);
}
