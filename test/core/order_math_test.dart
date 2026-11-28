import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/core/order_math.dart';

void main() {
  test('subtotal, shipping fee and total for the PRD example', () {
    final q = quoteOrder(
      lines: [
        QuoteLine(unitPrice: Money.parse('450.00'), qty: 1),
        QuoteLine(unitPrice: Money.parse('180.00'), qty: 1),
      ],
      shippingFee: Money.parse('50.00'),
    );
    expect(q.subtotal, Money(63000));
    expect(q.shippingFee, Money(5000));
    expect(q.total, Money(68000));
  });
  test('an empty list ships nothing and costs nothing', () {
    final q = quoteOrder(lines: [], shippingFee: Money.parse('50.00'));
    expect(q.subtotal, Money.zero);
    expect(q.shippingFee, Money.zero);
    expect(q.total, Money.zero);
  });
  test('a line with qty below 1 is rejected', () {
    expect(
      () => quoteOrder(
        lines: [QuoteLine(unitPrice: Money(100), qty: 0)],
        shippingFee: Money.zero,
      ),
      throwsArgumentError,
    );
    expect(
      () => quoteOrder(
        lines: [QuoteLine(unitPrice: Money(100), qty: -1)],
        shippingFee: Money.zero,
      ),
      throwsArgumentError,
    );
  });
  test('OrderQuote compares by its three amounts', () {
    OrderQuote q(int total) => OrderQuote(
      subtotal: Money(1),
      shippingFee: Money(2),
      total: Money(total),
    );
    expect(q(3), q(3));
    expect(q(3).hashCode, q(3).hashCode);
    expect(q(3), isNot(q(4)));
  });
}
