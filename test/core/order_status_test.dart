import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/order_status.dart';

void main() {
  test('next moves one step at a time and ends at Delivered or Cancelled', () {
    expect(OrderStatus.paid.next, OrderStatus.packed);
    expect(OrderStatus.packed.next, OrderStatus.shipped);
    expect(OrderStatus.shipped.next, OrderStatus.delivered);
    expect(OrderStatus.delivered.next, isNull);
    expect(OrderStatus.cancelled.next, isNull);
  });
  test('customers can cancel only before Shipped', () {
    expect(OrderStatus.paid.canCustomerCancel, isTrue);
    expect(OrderStatus.packed.canCustomerCancel, isTrue);
    expect(OrderStatus.shipped.canCustomerCancel, isFalse);
    expect(OrderStatus.delivered.canCustomerCancel, isFalse);
    expect(OrderStatus.cancelled.canCustomerCancel, isFalse);
  });
  test('admin can cancel before Delivered', () {
    expect(OrderStatus.paid.canAdminCancel, isTrue);
    expect(OrderStatus.packed.canAdminCancel, isTrue);
    expect(OrderStatus.shipped.canAdminCancel, isTrue);
    expect(OrderStatus.delivered.canAdminCancel, isFalse);
    expect(OrderStatus.cancelled.canAdminCancel, isFalse);
  });
}
