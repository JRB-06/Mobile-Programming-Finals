// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LineAvailability {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LineAvailability);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LineAvailability()';
}


}

/// @nodoc
class $LineAvailabilityCopyWith<$Res>  {
$LineAvailabilityCopyWith(LineAvailability _, $Res Function(LineAvailability) __);
}


/// Adds pattern-matching-related methods to [LineAvailability].
extension LineAvailabilityPatterns on LineAvailability {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LineOk value)?  ok,TResult Function( LineOutOfStock value)?  outOfStock,TResult Function( LineReducedStock value)?  reducedStock,TResult Function( LineUnavailable value)?  unavailable,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LineOk() when ok != null:
return ok(_that);case LineOutOfStock() when outOfStock != null:
return outOfStock(_that);case LineReducedStock() when reducedStock != null:
return reducedStock(_that);case LineUnavailable() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LineOk value)  ok,required TResult Function( LineOutOfStock value)  outOfStock,required TResult Function( LineReducedStock value)  reducedStock,required TResult Function( LineUnavailable value)  unavailable,}){
final _that = this;
switch (_that) {
case LineOk():
return ok(_that);case LineOutOfStock():
return outOfStock(_that);case LineReducedStock():
return reducedStock(_that);case LineUnavailable():
return unavailable(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LineOk value)?  ok,TResult? Function( LineOutOfStock value)?  outOfStock,TResult? Function( LineReducedStock value)?  reducedStock,TResult? Function( LineUnavailable value)?  unavailable,}){
final _that = this;
switch (_that) {
case LineOk() when ok != null:
return ok(_that);case LineOutOfStock() when outOfStock != null:
return outOfStock(_that);case LineReducedStock() when reducedStock != null:
return reducedStock(_that);case LineUnavailable() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  ok,TResult Function()?  outOfStock,TResult Function( int max)?  reducedStock,TResult Function()?  unavailable,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LineOk() when ok != null:
return ok();case LineOutOfStock() when outOfStock != null:
return outOfStock();case LineReducedStock() when reducedStock != null:
return reducedStock(_that.max);case LineUnavailable() when unavailable != null:
return unavailable();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  ok,required TResult Function()  outOfStock,required TResult Function( int max)  reducedStock,required TResult Function()  unavailable,}) {final _that = this;
switch (_that) {
case LineOk():
return ok();case LineOutOfStock():
return outOfStock();case LineReducedStock():
return reducedStock(_that.max);case LineUnavailable():
return unavailable();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  ok,TResult? Function()?  outOfStock,TResult? Function( int max)?  reducedStock,TResult? Function()?  unavailable,}) {final _that = this;
switch (_that) {
case LineOk() when ok != null:
return ok();case LineOutOfStock() when outOfStock != null:
return outOfStock();case LineReducedStock() when reducedStock != null:
return reducedStock(_that.max);case LineUnavailable() when unavailable != null:
return unavailable();case _:
  return null;

}
}

}

/// @nodoc


class LineOk implements LineAvailability {
  const LineOk();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LineOk);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LineAvailability.ok()';
}


}




/// @nodoc


class LineOutOfStock implements LineAvailability {
  const LineOutOfStock();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LineOutOfStock);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LineAvailability.outOfStock()';
}


}




/// @nodoc


class LineReducedStock implements LineAvailability {
  const LineReducedStock(this.max);
  

 final  int max;

/// Create a copy of LineAvailability
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineReducedStockCopyWith<LineReducedStock> get copyWith => _$LineReducedStockCopyWithImpl<LineReducedStock>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LineReducedStock&&(identical(other.max, max) || other.max == max));
}


@override
int get hashCode {
    return Object.hash(runtimeType,max);
}

@override
String toString() {
    return 'LineAvailability.reducedStock(max: $max)';
}


}

/// @nodoc
abstract mixin class $LineReducedStockCopyWith<$Res> implements $LineAvailabilityCopyWith<$Res> {
  factory $LineReducedStockCopyWith(LineReducedStock value, $Res Function(LineReducedStock) _then) = _$LineReducedStockCopyWithImpl;
@useResult
$Res call({
 int max
});




}
/// @nodoc
class _$LineReducedStockCopyWithImpl<$Res>
    implements $LineReducedStockCopyWith<$Res> {
  _$LineReducedStockCopyWithImpl(this._self, this._then);

  final LineReducedStock _self;
  final $Res Function(LineReducedStock) _then;

/// Create a copy of LineAvailability
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? max = null,}) {
  return _then(LineReducedStock(
null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LineUnavailable implements LineAvailability {
  const LineUnavailable();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LineUnavailable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LineAvailability.unavailable()';
}


}




/// @nodoc
mixin _$CartLine {

 String get variantId; String get productId; String get productName; String get pharmacistName; String get variantLabel; Tier get tier; String? get imageUrl; Money get unitPrice; int get qty; LineAvailability get availability;
/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartLineCopyWith<CartLine> get copyWith => _$CartLineCopyWithImpl<CartLine>(this as CartLine, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CartLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLine&&(identical(other.variantId, _this.variantId) || other.variantId == _this.variantId)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.productName, _this.productName) || other.productName == _this.productName)&&(identical(other.pharmacistName, _this.pharmacistName) || other.pharmacistName == _this.pharmacistName)&&(identical(other.variantLabel, _this.variantLabel) || other.variantLabel == _this.variantLabel)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.qty, _this.qty) || other.qty == _this.qty)&&(identical(other.availability, _this.availability) || other.availability == _this.availability));
}


@override
int get hashCode {
  final _this = this as CartLine;
  return Object.hash(runtimeType,_this.variantId,_this.productId,_this.productName,_this.pharmacistName,_this.variantLabel,_this.tier,_this.imageUrl,_this.unitPrice,_this.qty,_this.availability);
}

@override
String toString() {
  final _this = this as CartLine;
  return 'CartLine(variantId: ${_this.variantId}, productId: ${_this.productId}, productName: ${_this.productName}, pharmacistName: ${_this.pharmacistName}, variantLabel: ${_this.variantLabel}, tier: ${_this.tier}, imageUrl: ${_this.imageUrl}, unitPrice: ${_this.unitPrice}, qty: ${_this.qty}, availability: ${_this.availability})';
}


}

/// @nodoc
abstract mixin class $CartLineCopyWith<$Res>  {
  factory $CartLineCopyWith(CartLine value, $Res Function(CartLine) _then) = _$CartLineCopyWithImpl;
@useResult
$Res call({
 String variantId, String productId, String productName, String pharmacistName, String variantLabel, Tier tier, String? imageUrl, Money unitPrice, int qty, LineAvailability availability
});


$LineAvailabilityCopyWith<$Res> get availability;

}
/// @nodoc
class _$CartLineCopyWithImpl<$Res>
    implements $CartLineCopyWith<$Res> {
  _$CartLineCopyWithImpl(this._self, this._then);

  final CartLine _self;
  final $Res Function(CartLine) _then;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? productId = null,Object? productName = null,Object? pharmacistName = null,Object? variantLabel = null,Object? tier = null,Object? imageUrl = freezed,Object? unitPrice = null,Object? qty = null,Object? availability = null,}) {
  return _then(CartLine(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,pharmacistName: null == pharmacistName ? _self.pharmacistName : pharmacistName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as Tier,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as Money,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as LineAvailability,
  ));
}
/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LineAvailabilityCopyWith<$Res> get availability {
  
  return $LineAvailabilityCopyWith<$Res>(_self.availability, (value) {
    return _then(_self.copyWith(availability: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartLine].
extension CartLinePatterns on CartLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartLine value)  $default,){
final _that = this;
switch (_that) {
case _CartLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartLine value)?  $default,){
final _that = this;
switch (_that) {
case _CartLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String variantId,  String productId,  String productName,  String pharmacistName,  String variantLabel,  Tier tier,  String? imageUrl,  Money unitPrice,  int qty,  LineAvailability availability)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartLine() when $default != null:
return $default(_that.variantId,_that.productId,_that.productName,_that.pharmacistName,_that.variantLabel,_that.tier,_that.imageUrl,_that.unitPrice,_that.qty,_that.availability);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String variantId,  String productId,  String productName,  String pharmacistName,  String variantLabel,  Tier tier,  String? imageUrl,  Money unitPrice,  int qty,  LineAvailability availability)  $default,) {final _that = this;
switch (_that) {
case _CartLine():
return $default(_that.variantId,_that.productId,_that.productName,_that.pharmacistName,_that.variantLabel,_that.tier,_that.imageUrl,_that.unitPrice,_that.qty,_that.availability);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String variantId,  String productId,  String productName,  String pharmacistName,  String variantLabel,  Tier tier,  String? imageUrl,  Money unitPrice,  int qty,  LineAvailability availability)?  $default,) {final _that = this;
switch (_that) {
case _CartLine() when $default != null:
return $default(_that.variantId,_that.productId,_that.productName,_that.pharmacistName,_that.variantLabel,_that.tier,_that.imageUrl,_that.unitPrice,_that.qty,_that.availability);case _:
  return null;

}
}

}

/// @nodoc


class _CartLine implements CartLine {
  const _CartLine({required this.variantId, required this.productId, required this.productName, required this.pharmacistName, required this.variantLabel, required this.tier, this.imageUrl, required this.unitPrice, required this.qty, this.availability = const LineAvailability.ok()});
  

@override final  String variantId;
@override final  String productId;
@override final  String productName;
@override final  String pharmacistName;
@override final  String variantLabel;
@override final  Tier tier;
@override final  String? imageUrl;
@override final  Money unitPrice;
@override final  int qty;
@override@JsonKey() final  LineAvailability availability;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartLineCopyWith<_CartLine> get copyWith => __$CartLineCopyWithImpl<_CartLine>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartLine&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.pharmacistName, pharmacistName) || other.pharmacistName == pharmacistName)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.availability, availability) || other.availability == availability));
}


@override
int get hashCode {
    return Object.hash(runtimeType,variantId,productId,productName,pharmacistName,variantLabel,tier,imageUrl,unitPrice,qty,availability);
}

@override
String toString() {
    return 'CartLine(variantId: $variantId, productId: $productId, productName: $productName, pharmacistName: $pharmacistName, variantLabel: $variantLabel, tier: $tier, imageUrl: $imageUrl, unitPrice: $unitPrice, qty: $qty, availability: $availability)';
}


}

/// @nodoc
abstract mixin class _$CartLineCopyWith<$Res> implements $CartLineCopyWith<$Res> {
  factory _$CartLineCopyWith(_CartLine value, $Res Function(_CartLine) _then) = __$CartLineCopyWithImpl;
@override @useResult
$Res call({
 String variantId, String productId, String productName, String pharmacistName, String variantLabel, Tier tier, String? imageUrl, Money unitPrice, int qty, LineAvailability availability
});


@override $LineAvailabilityCopyWith<$Res> get availability;

}
/// @nodoc
class __$CartLineCopyWithImpl<$Res>
    implements _$CartLineCopyWith<$Res> {
  __$CartLineCopyWithImpl(this._self, this._then);

  final _CartLine _self;
  final $Res Function(_CartLine) _then;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? productId = null,Object? productName = null,Object? pharmacistName = null,Object? variantLabel = null,Object? tier = null,Object? imageUrl = freezed,Object? unitPrice = null,Object? qty = null,Object? availability = null,}) {
  return _then(_CartLine(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,pharmacistName: null == pharmacistName ? _self.pharmacistName : pharmacistName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as Tier,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as Money,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as LineAvailability,
  ));
}

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LineAvailabilityCopyWith<$Res> get availability {
  
  return $LineAvailabilityCopyWith<$Res>(_self.availability, (value) {
    return _then(_self.copyWith(availability: value));
  });
}
}

/// @nodoc
mixin _$Cart {

 List<CartLine> get lines; OrderQuote get quote;
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartCopyWith<Cart> get copyWith => _$CartCopyWithImpl<Cart>(this as Cart, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Cart;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cart&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.quote, _this.quote) || other.quote == _this.quote));
}


@override
int get hashCode {
  final _this = this as Cart;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.lines),_this.quote);
}

@override
String toString() {
  final _this = this as Cart;
  return 'Cart(lines: ${_this.lines}, quote: ${_this.quote})';
}


}

/// @nodoc
abstract mixin class $CartCopyWith<$Res>  {
  factory $CartCopyWith(Cart value, $Res Function(Cart) _then) = _$CartCopyWithImpl;
@useResult
$Res call({
 List<CartLine> lines, OrderQuote quote
});




}
/// @nodoc
class _$CartCopyWithImpl<$Res>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._self, this._then);

  final Cart _self;
  final $Res Function(Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lines = null,Object? quote = null,}) {
  return _then(Cart(
lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<CartLine>,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as OrderQuote,
  ));
}

}


/// Adds pattern-matching-related methods to [Cart].
extension CartPatterns on Cart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cart value)  $default,){
final _that = this;
switch (_that) {
case _Cart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cart value)?  $default,){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CartLine> lines,  OrderQuote quote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.lines,_that.quote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CartLine> lines,  OrderQuote quote)  $default,) {final _that = this;
switch (_that) {
case _Cart():
return $default(_that.lines,_that.quote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CartLine> lines,  OrderQuote quote)?  $default,) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.lines,_that.quote);case _:
  return null;

}
}

}

/// @nodoc


class _Cart extends Cart {
  const _Cart({ List<CartLine> lines = const <CartLine>[], required this.quote}): _lines = lines,super._();
  

 final  List<CartLine> _lines;
@override@JsonKey() List<CartLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  OrderQuote quote;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartCopyWith<_Cart> get copyWith => __$CartCopyWithImpl<_Cart>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cart&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.quote, quote) || other.quote == quote));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_lines),quote);
}

@override
String toString() {
    return 'Cart(lines: $lines, quote: $quote)';
}


}

/// @nodoc
abstract mixin class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) _then) = __$CartCopyWithImpl;
@override @useResult
$Res call({
 List<CartLine> lines, OrderQuote quote
});




}
/// @nodoc
class __$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(this._self, this._then);

  final _Cart _self;
  final $Res Function(_Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lines = null,Object? quote = null,}) {
  return _then(_Cart(
lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<CartLine>,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as OrderQuote,
  ));
}


}

// dart format on
