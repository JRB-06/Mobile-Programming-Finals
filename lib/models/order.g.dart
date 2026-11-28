// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  customerId: json['customer_id'] as String?,
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  subtotal: const MoneyConverter().fromJson(json['subtotal'] as Object),
  shippingFee: const MoneyConverter().fromJson(json['shipping_fee'] as Object),
  total: const MoneyConverter().fromJson(json['total'] as Object),
  cardBrand: $enumDecodeNullable(_$CardBrandEnumMap, json['card_brand']),
  cardLast4: json['card_last4'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  statusUpdatedAt: json['status_updated_at'] == null
      ? null
      : DateTime.parse(json['status_updated_at'] as String),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'subtotal': const MoneyConverter().toJson(instance.subtotal),
  'shipping_fee': const MoneyConverter().toJson(instance.shippingFee),
  'total': const MoneyConverter().toJson(instance.total),
  'card_brand': _$CardBrandEnumMap[instance.cardBrand],
  'card_last4': instance.cardLast4,
  'created_at': instance.createdAt.toIso8601String(),
  'status_updated_at': instance.statusUpdatedAt?.toIso8601String(),
};

const _$OrderStatusEnumMap = {
  OrderStatus.paid: 'paid',
  OrderStatus.packed: 'packed',
  OrderStatus.shipped: 'shipped',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};

const _$CardBrandEnumMap = {
  CardBrand.visa: 'visa',
  CardBrand.mastercard: 'mastercard',
  CardBrand.amex: 'amex',
};

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  id: json['id'] as String,
  orderId: json['order_id'] as String,
  variantId: json['variant_id'] as String,
  productId: json['product_id'] as String,
  productName: json['product_name'] as String,
  pharmacistName: json['pharmacist_name'] as String,
  variantLabel: json['variant_label'] as String,
  unitPrice: const MoneyConverter().fromJson(json['unit_price'] as Object),
  qty: (json['qty'] as num).toInt(),
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'variant_id': instance.variantId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'pharmacist_name': instance.pharmacistName,
      'variant_label': instance.variantLabel,
      'unit_price': const MoneyConverter().toJson(instance.unitPrice),
      'qty': instance.qty,
    };

_OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => _OrderDetail(
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OrderItem>[],
  shippingAddress: json['shipping_address'] == null
      ? null
      : Address.fromJson(json['shipping_address'] as Map<String, dynamic>),
  timeline:
      (json['timeline'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$OrderStatusEnumMap, e))
          .toList() ??
      const <OrderStatus>[],
  reviewableItemIds:
      (json['reviewable_item_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  customer: json['customer'] == null
      ? null
      : CustomerRow.fromJson(json['customer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderDetailToJson(
  _OrderDetail instance,
) => <String, dynamic>{
  'order': instance.order.toJson(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'shipping_address': instance.shippingAddress?.toJson(),
  'timeline': instance.timeline.map((e) => _$OrderStatusEnumMap[e]!).toList(),
  'reviewable_item_ids': instance.reviewableItemIds,
  'customer': instance.customer?.toJson(),
};
