import 'package:los_pollos_hermanos/core/money.dart';

class QuoteLine {
  const QuoteLine({required this.unitPrice, required this.qty});

  final Money unitPrice;
  final int qty;
}

class OrderQuote {
  const OrderQuote({
    required this.subtotal,
    required this.shippingFee,
    required this.total,
  });

  final Money subtotal;
  final Money shippingFee;
  final Money total;

  @override
  bool operator ==(Object other) =>
      other is OrderQuote &&
      other.subtotal == subtotal &&
      other.shippingFee == shippingFee &&
      other.total == total;

  @override
  int get hashCode => Object.hash(subtotal, shippingFee, total);
}

OrderQuote quoteOrder({
  required List<QuoteLine> lines,
  required Money shippingFee,
}) {
  if (lines.isEmpty) {
    return const OrderQuote(
      subtotal: Money.zero,
      shippingFee: Money.zero,
      total: Money.zero,
    );
  }
  var subtotal = Money.zero;
  for (final line in lines) {
    if (line.qty <= 0) {
      throw ArgumentError.value(line.qty, 'qty', 'must be at least 1');
    }
    subtotal += line.unitPrice * line.qty;
  }
  return OrderQuote(
    subtotal: subtotal,
    shippingFee: shippingFee,
    total: subtotal + shippingFee,
  );
}
