// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerRow {

 String get id; String get fullName; String get email; String? get phone; bool get isBanned; int get orderCount; DateTime? get createdAt;
/// Create a copy of CustomerRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerRowCopyWith<CustomerRow> get copyWith => _$CustomerRowCopyWithImpl<CustomerRow>(this as CustomerRow, _$identity);

  /// Serializes this CustomerRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CustomerRow;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerRow&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.isBanned, _this.isBanned) || other.isBanned == _this.isBanned)&&(identical(other.orderCount, _this.orderCount) || other.orderCount == _this.orderCount)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CustomerRow;
  return Object.hash(runtimeType,_this.id,_this.fullName,_this.email,_this.phone,_this.isBanned,_this.orderCount,_this.createdAt);
}

@override
String toString() {
  final _this = this as CustomerRow;
  return 'CustomerRow(id: ${_this.id}, fullName: ${_this.fullName}, email: ${_this.email}, phone: ${_this.phone}, isBanned: ${_this.isBanned}, orderCount: ${_this.orderCount}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $CustomerRowCopyWith<$Res>  {
  factory $CustomerRowCopyWith(CustomerRow value, $Res Function(CustomerRow) _then) = _$CustomerRowCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, String email, String? phone, bool isBanned, int orderCount, DateTime? createdAt
});




}
/// @nodoc
class _$CustomerRowCopyWithImpl<$Res>
    implements $CustomerRowCopyWith<$Res> {
  _$CustomerRowCopyWithImpl(this._self, this._then);

  final CustomerRow _self;
  final $Res Function(CustomerRow) _then;

/// Create a copy of CustomerRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? phone = freezed,Object? isBanned = null,Object? orderCount = null,Object? createdAt = freezed,}) {
  return _then(CustomerRow(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerRow].
extension CustomerRowPatterns on CustomerRow {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerRow() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerRow value)  $default,){
final _that = this;
switch (_that) {
case _CustomerRow():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerRow value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerRow() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  String email,  String? phone,  bool isBanned,  int orderCount,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerRow() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.isBanned,_that.orderCount,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  String email,  String? phone,  bool isBanned,  int orderCount,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CustomerRow():
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.isBanned,_that.orderCount,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  String email,  String? phone,  bool isBanned,  int orderCount,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CustomerRow() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.isBanned,_that.orderCount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerRow implements CustomerRow {
  const _CustomerRow({required this.id, required this.fullName, required this.email, this.phone, this.isBanned = false, this.orderCount = 0, this.createdAt});
  factory _CustomerRow.fromJson(Map<String, dynamic> json) => _$CustomerRowFromJson(json);

@override final  String id;
@override final  String fullName;
@override final  String email;
@override final  String? phone;
@override@JsonKey() final  bool isBanned;
@override@JsonKey() final  int orderCount;
@override final  DateTime? createdAt;

/// Create a copy of CustomerRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerRowCopyWith<_CustomerRow> get copyWith => __$CustomerRowCopyWithImpl<_CustomerRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerRowToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerRow&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,fullName,email,phone,isBanned,orderCount,createdAt);
}

@override
String toString() {
    return 'CustomerRow(id: $id, fullName: $fullName, email: $email, phone: $phone, isBanned: $isBanned, orderCount: $orderCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CustomerRowCopyWith<$Res> implements $CustomerRowCopyWith<$Res> {
  factory _$CustomerRowCopyWith(_CustomerRow value, $Res Function(_CustomerRow) _then) = __$CustomerRowCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, String email, String? phone, bool isBanned, int orderCount, DateTime? createdAt
});




}
/// @nodoc
class __$CustomerRowCopyWithImpl<$Res>
    implements _$CustomerRowCopyWith<$Res> {
  __$CustomerRowCopyWithImpl(this._self, this._then);

  final _CustomerRow _self;
  final $Res Function(_CustomerRow) _then;

/// Create a copy of CustomerRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? phone = freezed,Object? isBanned = null,Object? orderCount = null,Object? createdAt = freezed,}) {
  return _then(_CustomerRow(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Dashboard {

@MoneyConverter() Money get revenue; Map<OrderStatus, int> get ordersByStatus; int get customerCount; int get lowStockCount;
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardCopyWith<Dashboard> get copyWith => _$DashboardCopyWithImpl<Dashboard>(this as Dashboard, _$identity);

  /// Serializes this Dashboard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Dashboard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dashboard&&(identical(other.revenue, _this.revenue) || other.revenue == _this.revenue)&&const DeepCollectionEquality().equals(other.ordersByStatus, _this.ordersByStatus)&&(identical(other.customerCount, _this.customerCount) || other.customerCount == _this.customerCount)&&(identical(other.lowStockCount, _this.lowStockCount) || other.lowStockCount == _this.lowStockCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Dashboard;
  return Object.hash(runtimeType,_this.revenue,const DeepCollectionEquality().hash(_this.ordersByStatus),_this.customerCount,_this.lowStockCount);
}

@override
String toString() {
  final _this = this as Dashboard;
  return 'Dashboard(revenue: ${_this.revenue}, ordersByStatus: ${_this.ordersByStatus}, customerCount: ${_this.customerCount}, lowStockCount: ${_this.lowStockCount})';
}


}

/// @nodoc
abstract mixin class $DashboardCopyWith<$Res>  {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) _then) = _$DashboardCopyWithImpl;
@useResult
$Res call({
@MoneyConverter() Money revenue, Map<OrderStatus, int> ordersByStatus, int customerCount, int lowStockCount
});




}
/// @nodoc
class _$DashboardCopyWithImpl<$Res>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._self, this._then);

  final Dashboard _self;
  final $Res Function(Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? revenue = null,Object? ordersByStatus = null,Object? customerCount = null,Object? lowStockCount = null,}) {
  return _then(Dashboard(
revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as Money,ordersByStatus: null == ordersByStatus ? _self.ordersByStatus : ordersByStatus // ignore: cast_nullable_to_non_nullable
as Map<OrderStatus, int>,customerCount: null == customerCount ? _self.customerCount : customerCount // ignore: cast_nullable_to_non_nullable
as int,lowStockCount: null == lowStockCount ? _self.lowStockCount : lowStockCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Dashboard].
extension DashboardPatterns on Dashboard {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dashboard value)  $default,){
final _that = this;
switch (_that) {
case _Dashboard():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dashboard value)?  $default,){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MoneyConverter()  Money revenue,  Map<OrderStatus, int> ordersByStatus,  int customerCount,  int lowStockCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.revenue,_that.ordersByStatus,_that.customerCount,_that.lowStockCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MoneyConverter()  Money revenue,  Map<OrderStatus, int> ordersByStatus,  int customerCount,  int lowStockCount)  $default,) {final _that = this;
switch (_that) {
case _Dashboard():
return $default(_that.revenue,_that.ordersByStatus,_that.customerCount,_that.lowStockCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MoneyConverter()  Money revenue,  Map<OrderStatus, int> ordersByStatus,  int customerCount,  int lowStockCount)?  $default,) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.revenue,_that.ordersByStatus,_that.customerCount,_that.lowStockCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Dashboard implements Dashboard {
  const _Dashboard({@MoneyConverter() required this.revenue, required  Map<OrderStatus, int> ordersByStatus, required this.customerCount, required this.lowStockCount}): _ordersByStatus = ordersByStatus;
  factory _Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);

@override@MoneyConverter() final  Money revenue;
 final  Map<OrderStatus, int> _ordersByStatus;
@override Map<OrderStatus, int> get ordersByStatus {
  if (_ordersByStatus is EqualUnmodifiableMapView) return _ordersByStatus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_ordersByStatus);
}

@override final  int customerCount;
@override final  int lowStockCount;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardCopyWith<_Dashboard> get copyWith => __$DashboardCopyWithImpl<_Dashboard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dashboard&&(identical(other.revenue, revenue) || other.revenue == revenue)&&const DeepCollectionEquality().equals(other.ordersByStatus, _ordersByStatus)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.lowStockCount, lowStockCount) || other.lowStockCount == lowStockCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,revenue,const DeepCollectionEquality().hash(_ordersByStatus),customerCount,lowStockCount);
}

@override
String toString() {
    return 'Dashboard(revenue: $revenue, ordersByStatus: $ordersByStatus, customerCount: $customerCount, lowStockCount: $lowStockCount)';
}


}

/// @nodoc
abstract mixin class _$DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$DashboardCopyWith(_Dashboard value, $Res Function(_Dashboard) _then) = __$DashboardCopyWithImpl;
@override @useResult
$Res call({
@MoneyConverter() Money revenue, Map<OrderStatus, int> ordersByStatus, int customerCount, int lowStockCount
});




}
/// @nodoc
class __$DashboardCopyWithImpl<$Res>
    implements _$DashboardCopyWith<$Res> {
  __$DashboardCopyWithImpl(this._self, this._then);

  final _Dashboard _self;
  final $Res Function(_Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? revenue = null,Object? ordersByStatus = null,Object? customerCount = null,Object? lowStockCount = null,}) {
  return _then(_Dashboard(
revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as Money,ordersByStatus: null == ordersByStatus ? _self._ordersByStatus : ordersByStatus // ignore: cast_nullable_to_non_nullable
as Map<OrderStatus, int>,customerCount: null == customerCount ? _self.customerCount : customerCount // ignore: cast_nullable_to_non_nullable
as int,lowStockCount: null == lowStockCount ? _self.lowStockCount : lowStockCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
