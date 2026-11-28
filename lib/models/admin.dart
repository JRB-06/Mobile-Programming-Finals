import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/core/order_status.dart';

import 'converters.dart';

part 'admin.freezed.dart';
part 'admin.g.dart';

@freezed
abstract class CustomerRow with _$CustomerRow {
  const factory CustomerRow({
    required String id,
    required String fullName,
    required String email,
    String? phone,
    @Default(false) bool isBanned,
    @Default(0) int orderCount,
    DateTime? createdAt,
  }) = _CustomerRow;

  factory CustomerRow.fromJson(Map<String, dynamic> json) =>
      _$CustomerRowFromJson(json);
}

@freezed
abstract class Dashboard with _$Dashboard {
  const factory Dashboard({
    @MoneyConverter() required Money revenue,
    required Map<OrderStatus, int> ordersByStatus,
    required int customerCount,
    required int lowStockCount,
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}
