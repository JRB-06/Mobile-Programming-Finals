import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:los_pollos_hermanos/core/card_validator.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/core/order_status.dart';

import 'account.dart';
import 'admin.dart';
import 'converters.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    String? customerId,
    required OrderStatus status,
    @MoneyConverter() required Money subtotal,
    @MoneyConverter() required Money shippingFee,
    @MoneyConverter() required Money total,
    CardBrand? cardBrand,
    String? cardLast4,
    required DateTime createdAt,
    DateTime? statusUpdatedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String id,
    required String orderId,
    required String variantId,
    required String productId,
    required String productName,
    required String pharmacistName,
    required String variantLabel,
    @MoneyConverter() required Money unitPrice,
    required int qty,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
abstract class OrderDetail with _$OrderDetail {
  const factory OrderDetail({
    required Order order,
    @Default(<OrderItem>[]) List<OrderItem> items,

    /// Snapshot of the address at order time (`orders.shipping_address`).
    Address? shippingAddress,

    /// Statuses the order has reached, oldest first.
    @Default(<OrderStatus>[]) List<OrderStatus> timeline,

    /// OrderItem ids the Customer may still review.
    @Default(<String>[]) List<String> reviewableItemIds,

    /// Admin view only.
    CustomerRow? customer,
  }) = _OrderDetail;

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
}
