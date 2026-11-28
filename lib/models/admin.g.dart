// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerRow _$CustomerRowFromJson(Map<String, dynamic> json) => _CustomerRow(
  id: json['id'] as String,
  fullName: json['full_name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  isBanned: json['is_banned'] as bool? ?? false,
  orderCount: (json['order_count'] as num?)?.toInt() ?? 0,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$CustomerRowToJson(_CustomerRow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'is_banned': instance.isBanned,
      'order_count': instance.orderCount,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_Dashboard _$DashboardFromJson(Map<String, dynamic> json) => _Dashboard(
  revenue: const MoneyConverter().fromJson(json['revenue'] as Object),
  ordersByStatus: (json['orders_by_status'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry($enumDecode(_$OrderStatusEnumMap, k), (e as num).toInt()),
  ),
  customerCount: (json['customer_count'] as num).toInt(),
  lowStockCount: (json['low_stock_count'] as num).toInt(),
);

Map<String, dynamic> _$DashboardToJson(_Dashboard instance) =>
    <String, dynamic>{
      'revenue': const MoneyConverter().toJson(instance.revenue),
      'orders_by_status': instance.ordersByStatus.map(
        (k, e) => MapEntry(_$OrderStatusEnumMap[k]!, e),
      ),
      'customer_count': instance.customerCount,
      'low_stock_count': instance.lowStockCount,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.paid: 'paid',
  OrderStatus.packed: 'packed',
  OrderStatus.shipped: 'shipped',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};
