// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductFilter {

 String? get pharmacistId; String? get categoryId; Tier? get tier; ProductSort get sort;
/// Create a copy of ProductFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFilterCopyWith<ProductFilter> get copyWith => _$ProductFilterCopyWithImpl<ProductFilter>(this as ProductFilter, _$identity);

  /// Serializes this ProductFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductFilter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFilter&&(identical(other.pharmacistId, _this.pharmacistId) || other.pharmacistId == _this.pharmacistId)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.sort, _this.sort) || other.sort == _this.sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductFilter;
  return Object.hash(runtimeType,_this.pharmacistId,_this.categoryId,_this.tier,_this.sort);
}

@override
String toString() {
  final _this = this as ProductFilter;
  return 'ProductFilter(pharmacistId: ${_this.pharmacistId}, categoryId: ${_this.categoryId}, tier: ${_this.tier}, sort: ${_this.sort})';
}


}

/// @nodoc
abstract mixin class $ProductFilterCopyWith<$Res>  {
  factory $ProductFilterCopyWith(ProductFilter value, $Res Function(ProductFilter) _then) = _$ProductFilterCopyWithImpl;
@useResult
$Res call({
 String? pharmacistId, String? categoryId, Tier? tier, ProductSort sort
});




}
/// @nodoc
class _$ProductFilterCopyWithImpl<$Res>
    implements $ProductFilterCopyWith<$Res> {
  _$ProductFilterCopyWithImpl(this._self, this._then);

  final ProductFilter _self;
  final $Res Function(ProductFilter) _then;

/// Create a copy of ProductFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pharmacistId = freezed,Object? categoryId = freezed,Object? tier = freezed,Object? sort = null,}) {
  return _then(ProductFilter(
pharmacistId: freezed == pharmacistId ? _self.pharmacistId : pharmacistId // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,tier: freezed == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as Tier?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as ProductSort,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductFilter].
extension ProductFilterPatterns on ProductFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductFilter value)  $default,){
final _that = this;
switch (_that) {
case _ProductFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductFilter value)?  $default,){
final _that = this;
switch (_that) {
case _ProductFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? pharmacistId,  String? categoryId,  Tier? tier,  ProductSort sort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductFilter() when $default != null:
return $default(_that.pharmacistId,_that.categoryId,_that.tier,_that.sort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? pharmacistId,  String? categoryId,  Tier? tier,  ProductSort sort)  $default,) {final _that = this;
switch (_that) {
case _ProductFilter():
return $default(_that.pharmacistId,_that.categoryId,_that.tier,_that.sort);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? pharmacistId,  String? categoryId,  Tier? tier,  ProductSort sort)?  $default,) {final _that = this;
switch (_that) {
case _ProductFilter() when $default != null:
return $default(_that.pharmacistId,_that.categoryId,_that.tier,_that.sort);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductFilter implements ProductFilter {
  const _ProductFilter({this.pharmacistId, this.categoryId, this.tier, this.sort = ProductSort.newest});
  factory _ProductFilter.fromJson(Map<String, dynamic> json) => _$ProductFilterFromJson(json);

@override final  String? pharmacistId;
@override final  String? categoryId;
@override final  Tier? tier;
@override@JsonKey() final  ProductSort sort;

/// Create a copy of ProductFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductFilterCopyWith<_ProductFilter> get copyWith => __$ProductFilterCopyWithImpl<_ProductFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductFilterToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductFilter&&(identical(other.pharmacistId, pharmacistId) || other.pharmacistId == pharmacistId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,pharmacistId,categoryId,tier,sort);
}

@override
String toString() {
    return 'ProductFilter(pharmacistId: $pharmacistId, categoryId: $categoryId, tier: $tier, sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$ProductFilterCopyWith<$Res> implements $ProductFilterCopyWith<$Res> {
  factory _$ProductFilterCopyWith(_ProductFilter value, $Res Function(_ProductFilter) _then) = __$ProductFilterCopyWithImpl;
@override @useResult
$Res call({
 String? pharmacistId, String? categoryId, Tier? tier, ProductSort sort
});




}
/// @nodoc
class __$ProductFilterCopyWithImpl<$Res>
    implements _$ProductFilterCopyWith<$Res> {
  __$ProductFilterCopyWithImpl(this._self, this._then);

  final _ProductFilter _self;
  final $Res Function(_ProductFilter) _then;

/// Create a copy of ProductFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pharmacistId = freezed,Object? categoryId = freezed,Object? tier = freezed,Object? sort = null,}) {
  return _then(_ProductFilter(
pharmacistId: freezed == pharmacistId ? _self.pharmacistId : pharmacistId // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,tier: freezed == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as Tier?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as ProductSort,
  ));
}


}


/// @nodoc
mixin _$ProductCard {

 String get id; String get name; String? get imageUrl; String? get categoryName; String get pharmacistId; String get pharmacistName;@MoneyConverter() Money get minPrice;@MoneyConverter() Money get maxPrice; Tier get bestTier; bool get inStock; double get rating; int get reviewCount;
/// Create a copy of ProductCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCardCopyWith<ProductCard> get copyWith => _$ProductCardCopyWithImpl<ProductCard>(this as ProductCard, _$identity);

  /// Serializes this ProductCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductCard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductCard&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.categoryName, _this.categoryName) || other.categoryName == _this.categoryName)&&(identical(other.pharmacistId, _this.pharmacistId) || other.pharmacistId == _this.pharmacistId)&&(identical(other.pharmacistName, _this.pharmacistName) || other.pharmacistName == _this.pharmacistName)&&(identical(other.minPrice, _this.minPrice) || other.minPrice == _this.minPrice)&&(identical(other.maxPrice, _this.maxPrice) || other.maxPrice == _this.maxPrice)&&(identical(other.bestTier, _this.bestTier) || other.bestTier == _this.bestTier)&&(identical(other.inStock, _this.inStock) || other.inStock == _this.inStock)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.reviewCount, _this.reviewCount) || other.reviewCount == _this.reviewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductCard;
  return Object.hash(runtimeType,_this.id,_this.name,_this.imageUrl,_this.categoryName,_this.pharmacistId,_this.pharmacistName,_this.minPrice,_this.maxPrice,_this.bestTier,_this.inStock,_this.rating,_this.reviewCount);
}

@override
String toString() {
  final _this = this as ProductCard;
  return 'ProductCard(id: ${_this.id}, name: ${_this.name}, imageUrl: ${_this.imageUrl}, categoryName: ${_this.categoryName}, pharmacistId: ${_this.pharmacistId}, pharmacistName: ${_this.pharmacistName}, minPrice: ${_this.minPrice}, maxPrice: ${_this.maxPrice}, bestTier: ${_this.bestTier}, inStock: ${_this.inStock}, rating: ${_this.rating}, reviewCount: ${_this.reviewCount})';
}


}

/// @nodoc
abstract mixin class $ProductCardCopyWith<$Res>  {
  factory $ProductCardCopyWith(ProductCard value, $Res Function(ProductCard) _then) = _$ProductCardCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? imageUrl, String? categoryName, String pharmacistId, String pharmacistName,@MoneyConverter() Money minPrice,@MoneyConverter() Money maxPrice, Tier bestTier, bool inStock, double rating, int reviewCount
});




}
/// @nodoc
class _$ProductCardCopyWithImpl<$Res>
    implements $ProductCardCopyWith<$Res> {
  _$ProductCardCopyWithImpl(this._self, this._then);

  final ProductCard _self;
  final $Res Function(ProductCard) _then;

/// Create a copy of ProductCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? categoryName = freezed,Object? pharmacistId = null,Object? pharmacistName = null,Object? minPrice = null,Object? maxPrice = null,Object? bestTier = null,Object? inStock = null,Object? rating = null,Object? reviewCount = null,}) {
  return _then(ProductCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,pharmacistId: null == pharmacistId ? _self.pharmacistId : pharmacistId // ignore: cast_nullable_to_non_nullable
as String,pharmacistName: null == pharmacistName ? _self.pharmacistName : pharmacistName // ignore: cast_nullable_to_non_nullable
as String,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as Money,maxPrice: null == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as Money,bestTier: null == bestTier ? _self.bestTier : bestTier // ignore: cast_nullable_to_non_nullable
as Tier,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductCard].
extension ProductCardPatterns on ProductCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductCard value)  $default,){
final _that = this;
switch (_that) {
case _ProductCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductCard value)?  $default,){
final _that = this;
switch (_that) {
case _ProductCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? imageUrl,  String? categoryName,  String pharmacistId,  String pharmacistName, @MoneyConverter()  Money minPrice, @MoneyConverter()  Money maxPrice,  Tier bestTier,  bool inStock,  double rating,  int reviewCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductCard() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.categoryName,_that.pharmacistId,_that.pharmacistName,_that.minPrice,_that.maxPrice,_that.bestTier,_that.inStock,_that.rating,_that.reviewCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? imageUrl,  String? categoryName,  String pharmacistId,  String pharmacistName, @MoneyConverter()  Money minPrice, @MoneyConverter()  Money maxPrice,  Tier bestTier,  bool inStock,  double rating,  int reviewCount)  $default,) {final _that = this;
switch (_that) {
case _ProductCard():
return $default(_that.id,_that.name,_that.imageUrl,_that.categoryName,_that.pharmacistId,_that.pharmacistName,_that.minPrice,_that.maxPrice,_that.bestTier,_that.inStock,_that.rating,_that.reviewCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? imageUrl,  String? categoryName,  String pharmacistId,  String pharmacistName, @MoneyConverter()  Money minPrice, @MoneyConverter()  Money maxPrice,  Tier bestTier,  bool inStock,  double rating,  int reviewCount)?  $default,) {final _that = this;
switch (_that) {
case _ProductCard() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.categoryName,_that.pharmacistId,_that.pharmacistName,_that.minPrice,_that.maxPrice,_that.bestTier,_that.inStock,_that.rating,_that.reviewCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductCard implements ProductCard {
  const _ProductCard({required this.id, required this.name, this.imageUrl, this.categoryName, required this.pharmacistId, required this.pharmacistName, @MoneyConverter() required this.minPrice, @MoneyConverter() required this.maxPrice, required this.bestTier, required this.inStock, this.rating = 0, this.reviewCount = 0});
  factory _ProductCard.fromJson(Map<String, dynamic> json) => _$ProductCardFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? imageUrl;
@override final  String? categoryName;
@override final  String pharmacistId;
@override final  String pharmacistName;
@override@MoneyConverter() final  Money minPrice;
@override@MoneyConverter() final  Money maxPrice;
@override final  Tier bestTier;
@override final  bool inStock;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int reviewCount;

/// Create a copy of ProductCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCardCopyWith<_ProductCard> get copyWith => __$ProductCardCopyWithImpl<_ProductCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductCardToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductCard&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.pharmacistId, pharmacistId) || other.pharmacistId == pharmacistId)&&(identical(other.pharmacistName, pharmacistName) || other.pharmacistName == pharmacistName)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.bestTier, bestTier) || other.bestTier == bestTier)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,imageUrl,categoryName,pharmacistId,pharmacistName,minPrice,maxPrice,bestTier,inStock,rating,reviewCount);
}

@override
String toString() {
    return 'ProductCard(id: $id, name: $name, imageUrl: $imageUrl, categoryName: $categoryName, pharmacistId: $pharmacistId, pharmacistName: $pharmacistName, minPrice: $minPrice, maxPrice: $maxPrice, bestTier: $bestTier, inStock: $inStock, rating: $rating, reviewCount: $reviewCount)';
}


}

/// @nodoc
abstract mixin class _$ProductCardCopyWith<$Res> implements $ProductCardCopyWith<$Res> {
  factory _$ProductCardCopyWith(_ProductCard value, $Res Function(_ProductCard) _then) = __$ProductCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? imageUrl, String? categoryName, String pharmacistId, String pharmacistName,@MoneyConverter() Money minPrice,@MoneyConverter() Money maxPrice, Tier bestTier, bool inStock, double rating, int reviewCount
});




}
/// @nodoc
class __$ProductCardCopyWithImpl<$Res>
    implements _$ProductCardCopyWith<$Res> {
  __$ProductCardCopyWithImpl(this._self, this._then);

  final _ProductCard _self;
  final $Res Function(_ProductCard) _then;

/// Create a copy of ProductCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? categoryName = freezed,Object? pharmacistId = null,Object? pharmacistName = null,Object? minPrice = null,Object? maxPrice = null,Object? bestTier = null,Object? inStock = null,Object? rating = null,Object? reviewCount = null,}) {
  return _then(_ProductCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,pharmacistId: null == pharmacistId ? _self.pharmacistId : pharmacistId // ignore: cast_nullable_to_non_nullable
as String,pharmacistName: null == pharmacistName ? _self.pharmacistName : pharmacistName // ignore: cast_nullable_to_non_nullable
as String,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as Money,maxPrice: null == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as Money,bestTier: null == bestTier ? _self.bestTier : bestTier // ignore: cast_nullable_to_non_nullable
as Tier,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Variant {

 String get id; String get productId; num get purity; String get sizeLabel;@MoneyConverter() Money get price; int get stock; bool get archived;
/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantCopyWith<Variant> get copyWith => _$VariantCopyWithImpl<Variant>(this as Variant, _$identity);

  /// Serializes this Variant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Variant;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Variant&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.purity, _this.purity) || other.purity == _this.purity)&&(identical(other.sizeLabel, _this.sizeLabel) || other.sizeLabel == _this.sizeLabel)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.stock, _this.stock) || other.stock == _this.stock)&&(identical(other.archived, _this.archived) || other.archived == _this.archived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Variant;
  return Object.hash(runtimeType,_this.id,_this.productId,_this.purity,_this.sizeLabel,_this.price,_this.stock,_this.archived);
}

@override
String toString() {
  final _this = this as Variant;
  return 'Variant(id: ${_this.id}, productId: ${_this.productId}, purity: ${_this.purity}, sizeLabel: ${_this.sizeLabel}, price: ${_this.price}, stock: ${_this.stock}, archived: ${_this.archived})';
}


}

/// @nodoc
abstract mixin class $VariantCopyWith<$Res>  {
  factory $VariantCopyWith(Variant value, $Res Function(Variant) _then) = _$VariantCopyWithImpl;
@useResult
$Res call({
 String id, String productId, num purity, String sizeLabel,@MoneyConverter() Money price, int stock, bool archived
});




}
/// @nodoc
class _$VariantCopyWithImpl<$Res>
    implements $VariantCopyWith<$Res> {
  _$VariantCopyWithImpl(this._self, this._then);

  final Variant _self;
  final $Res Function(Variant) _then;

/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? purity = null,Object? sizeLabel = null,Object? price = null,Object? stock = null,Object? archived = null,}) {
  return _then(Variant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,purity: null == purity ? _self.purity : purity // ignore: cast_nullable_to_non_nullable
as num,sizeLabel: null == sizeLabel ? _self.sizeLabel : sizeLabel // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Variant].
extension VariantPatterns on Variant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Variant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Variant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Variant value)  $default,){
final _that = this;
switch (_that) {
case _Variant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Variant value)?  $default,){
final _that = this;
switch (_that) {
case _Variant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  num purity,  String sizeLabel, @MoneyConverter()  Money price,  int stock,  bool archived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Variant() when $default != null:
return $default(_that.id,_that.productId,_that.purity,_that.sizeLabel,_that.price,_that.stock,_that.archived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  num purity,  String sizeLabel, @MoneyConverter()  Money price,  int stock,  bool archived)  $default,) {final _that = this;
switch (_that) {
case _Variant():
return $default(_that.id,_that.productId,_that.purity,_that.sizeLabel,_that.price,_that.stock,_that.archived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  num purity,  String sizeLabel, @MoneyConverter()  Money price,  int stock,  bool archived)?  $default,) {final _that = this;
switch (_that) {
case _Variant() when $default != null:
return $default(_that.id,_that.productId,_that.purity,_that.sizeLabel,_that.price,_that.stock,_that.archived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Variant extends Variant {
  const _Variant({required this.id, required this.productId, required this.purity, required this.sizeLabel, @MoneyConverter() required this.price, required this.stock, this.archived = false}): super._();
  factory _Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);

@override final  String id;
@override final  String productId;
@override final  num purity;
@override final  String sizeLabel;
@override@MoneyConverter() final  Money price;
@override final  int stock;
@override@JsonKey() final  bool archived;

/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantCopyWith<_Variant> get copyWith => __$VariantCopyWithImpl<_Variant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariantToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Variant&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.purity, purity) || other.purity == purity)&&(identical(other.sizeLabel, sizeLabel) || other.sizeLabel == sizeLabel)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.archived, archived) || other.archived == archived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,productId,purity,sizeLabel,price,stock,archived);
}

@override
String toString() {
    return 'Variant(id: $id, productId: $productId, purity: $purity, sizeLabel: $sizeLabel, price: $price, stock: $stock, archived: $archived)';
}


}

/// @nodoc
abstract mixin class _$VariantCopyWith<$Res> implements $VariantCopyWith<$Res> {
  factory _$VariantCopyWith(_Variant value, $Res Function(_Variant) _then) = __$VariantCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, num purity, String sizeLabel,@MoneyConverter() Money price, int stock, bool archived
});




}
/// @nodoc
class __$VariantCopyWithImpl<$Res>
    implements _$VariantCopyWith<$Res> {
  __$VariantCopyWithImpl(this._self, this._then);

  final _Variant _self;
  final $Res Function(_Variant) _then;

/// Create a copy of Variant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? purity = null,Object? sizeLabel = null,Object? price = null,Object? stock = null,Object? archived = null,}) {
  return _then(_Variant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,purity: null == purity ? _self.purity : purity // ignore: cast_nullable_to_non_nullable
as num,sizeLabel: null == sizeLabel ? _self.sizeLabel : sizeLabel // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ProductDetail {

 String get id; String get name; String? get imageUrl; String? get categoryName; String get pharmacistId; String get pharmacistName;@MoneyConverter() Money get minPrice;@MoneyConverter() Money get maxPrice; Tier get bestTier; bool get inStock; double get rating; int get reviewCount; String get description; String get pharmacistPhotoUrl; List<String> get images; List<Variant> get variants;
/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailCopyWith<ProductDetail> get copyWith => _$ProductDetailCopyWithImpl<ProductDetail>(this as ProductDetail, _$identity);

  /// Serializes this ProductDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductDetail;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetail&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.categoryName, _this.categoryName) || other.categoryName == _this.categoryName)&&(identical(other.pharmacistId, _this.pharmacistId) || other.pharmacistId == _this.pharmacistId)&&(identical(other.pharmacistName, _this.pharmacistName) || other.pharmacistName == _this.pharmacistName)&&(identical(other.minPrice, _this.minPrice) || other.minPrice == _this.minPrice)&&(identical(other.maxPrice, _this.maxPrice) || other.maxPrice == _this.maxPrice)&&(identical(other.bestTier, _this.bestTier) || other.bestTier == _this.bestTier)&&(identical(other.inStock, _this.inStock) || other.inStock == _this.inStock)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.reviewCount, _this.reviewCount) || other.reviewCount == _this.reviewCount)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.pharmacistPhotoUrl, _this.pharmacistPhotoUrl) || other.pharmacistPhotoUrl == _this.pharmacistPhotoUrl)&&const DeepCollectionEquality().equals(other.images, _this.images)&&const DeepCollectionEquality().equals(other.variants, _this.variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductDetail;
  return Object.hash(runtimeType,_this.id,_this.name,_this.imageUrl,_this.categoryName,_this.pharmacistId,_this.pharmacistName,_this.minPrice,_this.maxPrice,_this.bestTier,_this.inStock,_this.rating,_this.reviewCount,_this.description,_this.pharmacistPhotoUrl,const DeepCollectionEquality().hash(_this.images),const DeepCollectionEquality().hash(_this.variants));
}

@override
String toString() {
  final _this = this as ProductDetail;
  return 'ProductDetail(id: ${_this.id}, name: ${_this.name}, imageUrl: ${_this.imageUrl}, categoryName: ${_this.categoryName}, pharmacistId: ${_this.pharmacistId}, pharmacistName: ${_this.pharmacistName}, minPrice: ${_this.minPrice}, maxPrice: ${_this.maxPrice}, bestTier: ${_this.bestTier}, inStock: ${_this.inStock}, rating: ${_this.rating}, reviewCount: ${_this.reviewCount}, description: ${_this.description}, pharmacistPhotoUrl: ${_this.pharmacistPhotoUrl}, images: ${_this.images}, variants: ${_this.variants})';
}


}

/// @nodoc
abstract mixin class $ProductDetailCopyWith<$Res>  {
  factory $ProductDetailCopyWith(ProductDetail value, $Res Function(ProductDetail) _then) = _$ProductDetailCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? imageUrl, String? categoryName, String pharmacistId, String pharmacistName,@MoneyConverter() Money minPrice,@MoneyConverter() Money maxPrice, Tier bestTier, bool inStock, double rating, int reviewCount, String description, String pharmacistPhotoUrl, List<String> images, List<Variant> variants
});




}
/// @nodoc
class _$ProductDetailCopyWithImpl<$Res>
    implements $ProductDetailCopyWith<$Res> {
  _$ProductDetailCopyWithImpl(this._self, this._then);

  final ProductDetail _self;
  final $Res Function(ProductDetail) _then;

/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? categoryName = freezed,Object? pharmacistId = null,Object? pharmacistName = null,Object? minPrice = null,Object? maxPrice = null,Object? bestTier = null,Object? inStock = null,Object? rating = null,Object? reviewCount = null,Object? description = null,Object? pharmacistPhotoUrl = null,Object? images = null,Object? variants = null,}) {
  return _then(ProductDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,pharmacistId: null == pharmacistId ? _self.pharmacistId : pharmacistId // ignore: cast_nullable_to_non_nullable
as String,pharmacistName: null == pharmacistName ? _self.pharmacistName : pharmacistName // ignore: cast_nullable_to_non_nullable
as String,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as Money,maxPrice: null == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as Money,bestTier: null == bestTier ? _self.bestTier : bestTier // ignore: cast_nullable_to_non_nullable
as Tier,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pharmacistPhotoUrl: null == pharmacistPhotoUrl ? _self.pharmacistPhotoUrl : pharmacistPhotoUrl // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variant>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetail].
extension ProductDetailPatterns on ProductDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetail value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? imageUrl,  String? categoryName,  String pharmacistId,  String pharmacistName, @MoneyConverter()  Money minPrice, @MoneyConverter()  Money maxPrice,  Tier bestTier,  bool inStock,  double rating,  int reviewCount,  String description,  String pharmacistPhotoUrl,  List<String> images,  List<Variant> variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetail() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.categoryName,_that.pharmacistId,_that.pharmacistName,_that.minPrice,_that.maxPrice,_that.bestTier,_that.inStock,_that.rating,_that.reviewCount,_that.description,_that.pharmacistPhotoUrl,_that.images,_that.variants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? imageUrl,  String? categoryName,  String pharmacistId,  String pharmacistName, @MoneyConverter()  Money minPrice, @MoneyConverter()  Money maxPrice,  Tier bestTier,  bool inStock,  double rating,  int reviewCount,  String description,  String pharmacistPhotoUrl,  List<String> images,  List<Variant> variants)  $default,) {final _that = this;
switch (_that) {
case _ProductDetail():
return $default(_that.id,_that.name,_that.imageUrl,_that.categoryName,_that.pharmacistId,_that.pharmacistName,_that.minPrice,_that.maxPrice,_that.bestTier,_that.inStock,_that.rating,_that.reviewCount,_that.description,_that.pharmacistPhotoUrl,_that.images,_that.variants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? imageUrl,  String? categoryName,  String pharmacistId,  String pharmacistName, @MoneyConverter()  Money minPrice, @MoneyConverter()  Money maxPrice,  Tier bestTier,  bool inStock,  double rating,  int reviewCount,  String description,  String pharmacistPhotoUrl,  List<String> images,  List<Variant> variants)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetail() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.categoryName,_that.pharmacistId,_that.pharmacistName,_that.minPrice,_that.maxPrice,_that.bestTier,_that.inStock,_that.rating,_that.reviewCount,_that.description,_that.pharmacistPhotoUrl,_that.images,_that.variants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDetail implements ProductDetail {
  const _ProductDetail({required this.id, required this.name, this.imageUrl, this.categoryName, required this.pharmacistId, required this.pharmacistName, @MoneyConverter() required this.minPrice, @MoneyConverter() required this.maxPrice, required this.bestTier, required this.inStock, this.rating = 0, this.reviewCount = 0, this.description = '', required this.pharmacistPhotoUrl,  List<String> images = const <String>[],  List<Variant> variants = const <Variant>[]}): _images = images,_variants = variants;
  factory _ProductDetail.fromJson(Map<String, dynamic> json) => _$ProductDetailFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? imageUrl;
@override final  String? categoryName;
@override final  String pharmacistId;
@override final  String pharmacistName;
@override@MoneyConverter() final  Money minPrice;
@override@MoneyConverter() final  Money maxPrice;
@override final  Tier bestTier;
@override final  bool inStock;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int reviewCount;
@override@JsonKey() final  String description;
@override final  String pharmacistPhotoUrl;
 final  List<String> _images;
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<Variant> _variants;
@override@JsonKey() List<Variant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}


/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailCopyWith<_ProductDetail> get copyWith => __$ProductDetailCopyWithImpl<_ProductDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.pharmacistId, pharmacistId) || other.pharmacistId == pharmacistId)&&(identical(other.pharmacistName, pharmacistName) || other.pharmacistName == pharmacistName)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.bestTier, bestTier) || other.bestTier == bestTier)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.description, description) || other.description == description)&&(identical(other.pharmacistPhotoUrl, pharmacistPhotoUrl) || other.pharmacistPhotoUrl == pharmacistPhotoUrl)&&const DeepCollectionEquality().equals(other.images, _images)&&const DeepCollectionEquality().equals(other.variants, _variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,imageUrl,categoryName,pharmacistId,pharmacistName,minPrice,maxPrice,bestTier,inStock,rating,reviewCount,description,pharmacistPhotoUrl,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_variants));
}

@override
String toString() {
    return 'ProductDetail(id: $id, name: $name, imageUrl: $imageUrl, categoryName: $categoryName, pharmacistId: $pharmacistId, pharmacistName: $pharmacistName, minPrice: $minPrice, maxPrice: $maxPrice, bestTier: $bestTier, inStock: $inStock, rating: $rating, reviewCount: $reviewCount, description: $description, pharmacistPhotoUrl: $pharmacistPhotoUrl, images: $images, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailCopyWith<$Res> implements $ProductDetailCopyWith<$Res> {
  factory _$ProductDetailCopyWith(_ProductDetail value, $Res Function(_ProductDetail) _then) = __$ProductDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? imageUrl, String? categoryName, String pharmacistId, String pharmacistName,@MoneyConverter() Money minPrice,@MoneyConverter() Money maxPrice, Tier bestTier, bool inStock, double rating, int reviewCount, String description, String pharmacistPhotoUrl, List<String> images, List<Variant> variants
});




}
/// @nodoc
class __$ProductDetailCopyWithImpl<$Res>
    implements _$ProductDetailCopyWith<$Res> {
  __$ProductDetailCopyWithImpl(this._self, this._then);

  final _ProductDetail _self;
  final $Res Function(_ProductDetail) _then;

/// Create a copy of ProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? categoryName = freezed,Object? pharmacistId = null,Object? pharmacistName = null,Object? minPrice = null,Object? maxPrice = null,Object? bestTier = null,Object? inStock = null,Object? rating = null,Object? reviewCount = null,Object? description = null,Object? pharmacistPhotoUrl = null,Object? images = null,Object? variants = null,}) {
  return _then(_ProductDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,pharmacistId: null == pharmacistId ? _self.pharmacistId : pharmacistId // ignore: cast_nullable_to_non_nullable
as String,pharmacistName: null == pharmacistName ? _self.pharmacistName : pharmacistName // ignore: cast_nullable_to_non_nullable
as String,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as Money,maxPrice: null == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as Money,bestTier: null == bestTier ? _self.bestTier : bestTier // ignore: cast_nullable_to_non_nullable
as Tier,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pharmacistPhotoUrl: null == pharmacistPhotoUrl ? _self.pharmacistPhotoUrl : pharmacistPhotoUrl // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variant>,
  ));
}


}

// dart format on
