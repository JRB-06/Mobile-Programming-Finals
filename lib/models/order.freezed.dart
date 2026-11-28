// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Order {

 String get id; String? get customerId; OrderStatus get status;@MoneyConverter() Money get subtotal;@MoneyConverter() Money get shippingFee;@MoneyConverter() Money get total; CardBrand? get cardBrand; String? get cardLast4; DateTime get createdAt; DateTime? get statusUpdatedAt;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Order;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.customerId, _this.customerId) || other.customerId == _this.customerId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.subtotal, _this.subtotal) || other.subtotal == _this.subtotal)&&(identical(other.shippingFee, _this.shippingFee) || other.shippingFee == _this.shippingFee)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.cardBrand, _this.cardBrand) || other.cardBrand == _this.cardBrand)&&(identical(other.cardLast4, _this.cardLast4) || other.cardLast4 == _this.cardLast4)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.statusUpdatedAt, _this.statusUpdatedAt) || other.statusUpdatedAt == _this.statusUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Order;
  return Object.hash(runtimeType,_this.id,_this.customerId,_this.status,_this.subtotal,_this.shippingFee,_this.total,_this.cardBrand,_this.cardLast4,_this.createdAt,_this.statusUpdatedAt);
}

@override
String toString() {
  final _this = this as Order;
  return 'Order(id: ${_this.id}, customerId: ${_this.customerId}, status: ${_this.status}, subtotal: ${_this.subtotal}, shippingFee: ${_this.shippingFee}, total: ${_this.total}, cardBrand: ${_this.cardBrand}, cardLast4: ${_this.cardLast4}, createdAt: ${_this.createdAt}, statusUpdatedAt: ${_this.statusUpdatedAt})';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, String? customerId, OrderStatus status,@MoneyConverter() Money subtotal,@MoneyConverter() Money shippingFee,@MoneyConverter() Money total, CardBrand? cardBrand, String? cardLast4, DateTime createdAt, DateTime? statusUpdatedAt
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = freezed,Object? status = null,Object? subtotal = null,Object? shippingFee = null,Object? total = null,Object? cardBrand = freezed,Object? cardLast4 = freezed,Object? createdAt = null,Object? statusUpdatedAt = freezed,}) {
  return _then(Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as Money,shippingFee: null == shippingFee ? _self.shippingFee : shippingFee // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,cardBrand: freezed == cardBrand ? _self.cardBrand : cardBrand // ignore: cast_nullable_to_non_nullable
as CardBrand?,cardLast4: freezed == cardLast4 ? _self.cardLast4 : cardLast4 // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,statusUpdatedAt: freezed == statusUpdatedAt ? _self.statusUpdatedAt : statusUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? customerId,  OrderStatus status, @MoneyConverter()  Money subtotal, @MoneyConverter()  Money shippingFee, @MoneyConverter()  Money total,  CardBrand? cardBrand,  String? cardLast4,  DateTime createdAt,  DateTime? statusUpdatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.customerId,_that.status,_that.subtotal,_that.shippingFee,_that.total,_that.cardBrand,_that.cardLast4,_that.createdAt,_that.statusUpdatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? customerId,  OrderStatus status, @MoneyConverter()  Money subtotal, @MoneyConverter()  Money shippingFee, @MoneyConverter()  Money total,  CardBrand? cardBrand,  String? cardLast4,  DateTime createdAt,  DateTime? statusUpdatedAt)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.customerId,_that.status,_that.subtotal,_that.shippingFee,_that.total,_that.cardBrand,_that.cardLast4,_that.createdAt,_that.statusUpdatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? customerId,  OrderStatus status, @MoneyConverter()  Money subtotal, @MoneyConverter()  Money shippingFee, @MoneyConverter()  Money total,  CardBrand? cardBrand,  String? cardLast4,  DateTime createdAt,  DateTime? statusUpdatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.customerId,_that.status,_that.subtotal,_that.shippingFee,_that.total,_that.cardBrand,_that.cardLast4,_that.createdAt,_that.statusUpdatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order implements Order {
  const _Order({required this.id, this.customerId, required this.status, @MoneyConverter() required this.subtotal, @MoneyConverter() required this.shippingFee, @MoneyConverter() required this.total, this.cardBrand, this.cardLast4, required this.createdAt, this.statusUpdatedAt});
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String id;
@override final  String? customerId;
@override final  OrderStatus status;
@override@MoneyConverter() final  Money subtotal;
@override@MoneyConverter() final  Money shippingFee;
@override@MoneyConverter() final  Money total;
@override final  CardBrand? cardBrand;
@override final  String? cardLast4;
@override final  DateTime createdAt;
@override final  DateTime? statusUpdatedAt;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingFee, shippingFee) || other.shippingFee == shippingFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.cardBrand, cardBrand) || other.cardBrand == cardBrand)&&(identical(other.cardLast4, cardLast4) || other.cardLast4 == cardLast4)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.statusUpdatedAt, statusUpdatedAt) || other.statusUpdatedAt == statusUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,customerId,status,subtotal,shippingFee,total,cardBrand,cardLast4,createdAt,statusUpdatedAt);
}

@override
String toString() {
    return 'Order(id: $id, customerId: $customerId, status: $status, subtotal: $subtotal, shippingFee: $shippingFee, total: $total, cardBrand: $cardBrand, cardLast4: $cardLast4, createdAt: $createdAt, statusUpdatedAt: $statusUpdatedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String? customerId, OrderStatus status,@MoneyConverter() Money subtotal,@MoneyConverter() Money shippingFee,@MoneyConverter() Money total, CardBrand? cardBrand, String? cardLast4, DateTime createdAt, DateTime? statusUpdatedAt
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = freezed,Object? status = null,Object? subtotal = null,Object? shippingFee = null,Object? total = null,Object? cardBrand = freezed,Object? cardLast4 = freezed,Object? createdAt = null,Object? statusUpdatedAt = freezed,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as Money,shippingFee: null == shippingFee ? _self.shippingFee : shippingFee // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,cardBrand: freezed == cardBrand ? _self.cardBrand : cardBrand // ignore: cast_nullable_to_non_nullable
as CardBrand?,cardLast4: freezed == cardLast4 ? _self.cardLast4 : cardLast4 // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,statusUpdatedAt: freezed == statusUpdatedAt ? _self.statusUpdatedAt : statusUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$OrderItem {

 String get id; String get orderId; String get variantId; String get productId; String get productName; String get pharmacistName; String get variantLabel;@MoneyConverter() Money get unitPrice; int get qty;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.variantId, _this.variantId) || other.variantId == _this.variantId)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.productName, _this.productName) || other.productName == _this.productName)&&(identical(other.pharmacistName, _this.pharmacistName) || other.pharmacistName == _this.pharmacistName)&&(identical(other.variantLabel, _this.variantLabel) || other.variantLabel == _this.variantLabel)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.qty, _this.qty) || other.qty == _this.qty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderItem;
  return Object.hash(runtimeType,_this.id,_this.orderId,_this.variantId,_this.productId,_this.productName,_this.pharmacistName,_this.variantLabel,_this.unitPrice,_this.qty);
}

@override
String toString() {
  final _this = this as OrderItem;
  return 'OrderItem(id: ${_this.id}, orderId: ${_this.orderId}, variantId: ${_this.variantId}, productId: ${_this.productId}, productName: ${_this.productName}, pharmacistName: ${_this.pharmacistName}, variantLabel: ${_this.variantLabel}, unitPrice: ${_this.unitPrice}, qty: ${_this.qty})';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 String id, String orderId, String variantId, String productId, String productName, String pharmacistName, String variantLabel,@MoneyConverter() Money unitPrice, int qty
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? variantId = null,Object? productId = null,Object? productName = null,Object? pharmacistName = null,Object? variantLabel = null,Object? unitPrice = null,Object? qty = null,}) {
  return _then(OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,pharmacistName: null == pharmacistName ? _self.pharmacistName : pharmacistName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as Money,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderId,  String variantId,  String productId,  String productName,  String pharmacistName,  String variantLabel, @MoneyConverter()  Money unitPrice,  int qty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.orderId,_that.variantId,_that.productId,_that.productName,_that.pharmacistName,_that.variantLabel,_that.unitPrice,_that.qty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderId,  String variantId,  String productId,  String productName,  String pharmacistName,  String variantLabel, @MoneyConverter()  Money unitPrice,  int qty)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.id,_that.orderId,_that.variantId,_that.productId,_that.productName,_that.pharmacistName,_that.variantLabel,_that.unitPrice,_that.qty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderId,  String variantId,  String productId,  String productName,  String pharmacistName,  String variantLabel, @MoneyConverter()  Money unitPrice,  int qty)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.orderId,_that.variantId,_that.productId,_that.productName,_that.pharmacistName,_that.variantLabel,_that.unitPrice,_that.qty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItem implements OrderItem {
  const _OrderItem({required this.id, required this.orderId, required this.variantId, required this.productId, required this.productName, required this.pharmacistName, required this.variantLabel, @MoneyConverter() required this.unitPrice, required this.qty});
  factory _OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

@override final  String id;
@override final  String orderId;
@override final  String variantId;
@override final  String productId;
@override final  String productName;
@override final  String pharmacistName;
@override final  String variantLabel;
@override@MoneyConverter() final  Money unitPrice;
@override final  int qty;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.pharmacistName, pharmacistName) || other.pharmacistName == pharmacistName)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.qty, qty) || other.qty == qty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderId,variantId,productId,productName,pharmacistName,variantLabel,unitPrice,qty);
}

@override
String toString() {
    return 'OrderItem(id: $id, orderId: $orderId, variantId: $variantId, productId: $productId, productName: $productName, pharmacistName: $pharmacistName, variantLabel: $variantLabel, unitPrice: $unitPrice, qty: $qty)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderId, String variantId, String productId, String productName, String pharmacistName, String variantLabel,@MoneyConverter() Money unitPrice, int qty
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? variantId = null,Object? productId = null,Object? productName = null,Object? pharmacistName = null,Object? variantLabel = null,Object? unitPrice = null,Object? qty = null,}) {
  return _then(_OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,pharmacistName: null == pharmacistName ? _self.pharmacistName : pharmacistName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as Money,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OrderDetail {

 Order get order; List<OrderItem> get items;/// Snapshot of the address at order time (`orders.shipping_address`).
 Address? get shippingAddress;/// Statuses the order has reached, oldest first.
 List<OrderStatus> get timeline;/// OrderItem ids the Customer may still review.
 List<String> get reviewableItemIds;/// Admin view only.
 CustomerRow? get customer;
/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailCopyWith<OrderDetail> get copyWith => _$OrderDetailCopyWithImpl<OrderDetail>(this as OrderDetail, _$identity);

  /// Serializes this OrderDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderDetail;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetail&&(identical(other.order, _this.order) || other.order == _this.order)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.shippingAddress, _this.shippingAddress) || other.shippingAddress == _this.shippingAddress)&&const DeepCollectionEquality().equals(other.timeline, _this.timeline)&&const DeepCollectionEquality().equals(other.reviewableItemIds, _this.reviewableItemIds)&&(identical(other.customer, _this.customer) || other.customer == _this.customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderDetail;
  return Object.hash(runtimeType,_this.order,const DeepCollectionEquality().hash(_this.items),_this.shippingAddress,const DeepCollectionEquality().hash(_this.timeline),const DeepCollectionEquality().hash(_this.reviewableItemIds),_this.customer);
}

@override
String toString() {
  final _this = this as OrderDetail;
  return 'OrderDetail(order: ${_this.order}, items: ${_this.items}, shippingAddress: ${_this.shippingAddress}, timeline: ${_this.timeline}, reviewableItemIds: ${_this.reviewableItemIds}, customer: ${_this.customer})';
}


}

/// @nodoc
abstract mixin class $OrderDetailCopyWith<$Res>  {
  factory $OrderDetailCopyWith(OrderDetail value, $Res Function(OrderDetail) _then) = _$OrderDetailCopyWithImpl;
@useResult
$Res call({
 Order order, List<OrderItem> items, Address? shippingAddress, List<OrderStatus> timeline, List<String> reviewableItemIds, CustomerRow? customer
});


$OrderCopyWith<$Res> get order;$AddressCopyWith<$Res>? get shippingAddress;$CustomerRowCopyWith<$Res>? get customer;

}
/// @nodoc
class _$OrderDetailCopyWithImpl<$Res>
    implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._self, this._then);

  final OrderDetail _self;
  final $Res Function(OrderDetail) _then;

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? items = null,Object? shippingAddress = freezed,Object? timeline = null,Object? reviewableItemIds = null,Object? customer = freezed,}) {
  return _then(OrderDetail(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,shippingAddress: freezed == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Address?,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<OrderStatus>,reviewableItemIds: null == reviewableItemIds ? _self.reviewableItemIds : reviewableItemIds // ignore: cast_nullable_to_non_nullable
as List<String>,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerRow?,
  ));
}
/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.shippingAddress!, (value) {
    return _then(_self.copyWith(shippingAddress: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerRowCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerRowCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderDetail].
extension OrderDetailPatterns on OrderDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetail value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetail value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Order order,  List<OrderItem> items,  Address? shippingAddress,  List<OrderStatus> timeline,  List<String> reviewableItemIds,  CustomerRow? customer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
return $default(_that.order,_that.items,_that.shippingAddress,_that.timeline,_that.reviewableItemIds,_that.customer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Order order,  List<OrderItem> items,  Address? shippingAddress,  List<OrderStatus> timeline,  List<String> reviewableItemIds,  CustomerRow? customer)  $default,) {final _that = this;
switch (_that) {
case _OrderDetail():
return $default(_that.order,_that.items,_that.shippingAddress,_that.timeline,_that.reviewableItemIds,_that.customer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Order order,  List<OrderItem> items,  Address? shippingAddress,  List<OrderStatus> timeline,  List<String> reviewableItemIds,  CustomerRow? customer)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetail() when $default != null:
return $default(_that.order,_that.items,_that.shippingAddress,_that.timeline,_that.reviewableItemIds,_that.customer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetail implements OrderDetail {
  const _OrderDetail({required this.order,  List<OrderItem> items = const <OrderItem>[], this.shippingAddress,  List<OrderStatus> timeline = const <OrderStatus>[],  List<String> reviewableItemIds = const <String>[], this.customer}): _items = items,_timeline = timeline,_reviewableItemIds = reviewableItemIds;
  factory _OrderDetail.fromJson(Map<String, dynamic> json) => _$OrderDetailFromJson(json);

@override final  Order order;
 final  List<OrderItem> _items;
@override@JsonKey() List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// Snapshot of the address at order time (`orders.shipping_address`).
@override final  Address? shippingAddress;
/// Statuses the order has reached, oldest first.
 final  List<OrderStatus> _timeline;
/// Statuses the order has reached, oldest first.
@override@JsonKey() List<OrderStatus> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

/// OrderItem ids the Customer may still review.
 final  List<String> _reviewableItemIds;
/// OrderItem ids the Customer may still review.
@override@JsonKey() List<String> get reviewableItemIds {
  if (_reviewableItemIds is EqualUnmodifiableListView) return _reviewableItemIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviewableItemIds);
}

/// Admin view only.
@override final  CustomerRow? customer;

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailCopyWith<_OrderDetail> get copyWith => __$OrderDetailCopyWithImpl<_OrderDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetail&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&const DeepCollectionEquality().equals(other.timeline, _timeline)&&const DeepCollectionEquality().equals(other.reviewableItemIds, _reviewableItemIds)&&(identical(other.customer, customer) || other.customer == customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,order,const DeepCollectionEquality().hash(_items),shippingAddress,const DeepCollectionEquality().hash(_timeline),const DeepCollectionEquality().hash(_reviewableItemIds),customer);
}

@override
String toString() {
    return 'OrderDetail(order: $order, items: $items, shippingAddress: $shippingAddress, timeline: $timeline, reviewableItemIds: $reviewableItemIds, customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailCopyWith<$Res> implements $OrderDetailCopyWith<$Res> {
  factory _$OrderDetailCopyWith(_OrderDetail value, $Res Function(_OrderDetail) _then) = __$OrderDetailCopyWithImpl;
@override @useResult
$Res call({
 Order order, List<OrderItem> items, Address? shippingAddress, List<OrderStatus> timeline, List<String> reviewableItemIds, CustomerRow? customer
});


@override $OrderCopyWith<$Res> get order;@override $AddressCopyWith<$Res>? get shippingAddress;@override $CustomerRowCopyWith<$Res>? get customer;

}
/// @nodoc
class __$OrderDetailCopyWithImpl<$Res>
    implements _$OrderDetailCopyWith<$Res> {
  __$OrderDetailCopyWithImpl(this._self, this._then);

  final _OrderDetail _self;
  final $Res Function(_OrderDetail) _then;

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? items = null,Object? shippingAddress = freezed,Object? timeline = null,Object? reviewableItemIds = null,Object? customer = freezed,}) {
  return _then(_OrderDetail(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,shippingAddress: freezed == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Address?,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<OrderStatus>,reviewableItemIds: null == reviewableItemIds ? _self._reviewableItemIds : reviewableItemIds // ignore: cast_nullable_to_non_nullable
as List<String>,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerRow?,
  ));
}

/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.shippingAddress!, (value) {
    return _then(_self.copyWith(shippingAddress: value));
  });
}/// Create a copy of OrderDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerRowCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerRowCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}

// dart format on
