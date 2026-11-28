// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagedProduct {

 String get id; String get pharmacistId; String? get categoryId; String get name; String get description; bool get archived; List<Variant> get variants;/// Storage paths in display order.
 List<String> get images;
/// Create a copy of ManagedProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagedProductCopyWith<ManagedProduct> get copyWith => _$ManagedProductCopyWithImpl<ManagedProduct>(this as ManagedProduct, _$identity);

  /// Serializes this ManagedProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManagedProduct;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagedProduct&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.pharmacistId, _this.pharmacistId) || other.pharmacistId == _this.pharmacistId)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.archived, _this.archived) || other.archived == _this.archived)&&const DeepCollectionEquality().equals(other.variants, _this.variants)&&const DeepCollectionEquality().equals(other.images, _this.images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManagedProduct;
  return Object.hash(runtimeType,_this.id,_this.pharmacistId,_this.categoryId,_this.name,_this.description,_this.archived,const DeepCollectionEquality().hash(_this.variants),const DeepCollectionEquality().hash(_this.images));
}

@override
String toString() {
  final _this = this as ManagedProduct;
  return 'ManagedProduct(id: ${_this.id}, pharmacistId: ${_this.pharmacistId}, categoryId: ${_this.categoryId}, name: ${_this.name}, description: ${_this.description}, archived: ${_this.archived}, variants: ${_this.variants}, images: ${_this.images})';
}


}

/// @nodoc
abstract mixin class $ManagedProductCopyWith<$Res>  {
  factory $ManagedProductCopyWith(ManagedProduct value, $Res Function(ManagedProduct) _then) = _$ManagedProductCopyWithImpl;
@useResult
$Res call({
 String id, String pharmacistId, String? categoryId, String name, String description, bool archived, List<Variant> variants, List<String> images
});




}
/// @nodoc
class _$ManagedProductCopyWithImpl<$Res>
    implements $ManagedProductCopyWith<$Res> {
  _$ManagedProductCopyWithImpl(this._self, this._then);

  final ManagedProduct _self;
  final $Res Function(ManagedProduct) _then;

/// Create a copy of ManagedProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pharmacistId = null,Object? categoryId = freezed,Object? name = null,Object? description = null,Object? archived = null,Object? variants = null,Object? images = null,}) {
  return _then(ManagedProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pharmacistId: null == pharmacistId ? _self.pharmacistId : pharmacistId // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variant>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagedProduct].
extension ManagedProductPatterns on ManagedProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagedProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagedProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagedProduct value)  $default,){
final _that = this;
switch (_that) {
case _ManagedProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagedProduct value)?  $default,){
final _that = this;
switch (_that) {
case _ManagedProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String pharmacistId,  String? categoryId,  String name,  String description,  bool archived,  List<Variant> variants,  List<String> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagedProduct() when $default != null:
return $default(_that.id,_that.pharmacistId,_that.categoryId,_that.name,_that.description,_that.archived,_that.variants,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String pharmacistId,  String? categoryId,  String name,  String description,  bool archived,  List<Variant> variants,  List<String> images)  $default,) {final _that = this;
switch (_that) {
case _ManagedProduct():
return $default(_that.id,_that.pharmacistId,_that.categoryId,_that.name,_that.description,_that.archived,_that.variants,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String pharmacistId,  String? categoryId,  String name,  String description,  bool archived,  List<Variant> variants,  List<String> images)?  $default,) {final _that = this;
switch (_that) {
case _ManagedProduct() when $default != null:
return $default(_that.id,_that.pharmacistId,_that.categoryId,_that.name,_that.description,_that.archived,_that.variants,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagedProduct implements ManagedProduct {
  const _ManagedProduct({required this.id, required this.pharmacistId, this.categoryId, required this.name, this.description = '', this.archived = false,  List<Variant> variants = const <Variant>[],  List<String> images = const <String>[]}): _variants = variants,_images = images;
  factory _ManagedProduct.fromJson(Map<String, dynamic> json) => _$ManagedProductFromJson(json);

@override final  String id;
@override final  String pharmacistId;
@override final  String? categoryId;
@override final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  bool archived;
 final  List<Variant> _variants;
@override@JsonKey() List<Variant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

/// Storage paths in display order.
 final  List<String> _images;
/// Storage paths in display order.
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of ManagedProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagedProductCopyWith<_ManagedProduct> get copyWith => __$ManagedProductCopyWithImpl<_ManagedProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagedProductToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagedProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.pharmacistId, pharmacistId) || other.pharmacistId == pharmacistId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.archived, archived) || other.archived == archived)&&const DeepCollectionEquality().equals(other.variants, _variants)&&const DeepCollectionEquality().equals(other.images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,pharmacistId,categoryId,name,description,archived,const DeepCollectionEquality().hash(_variants),const DeepCollectionEquality().hash(_images));
}

@override
String toString() {
    return 'ManagedProduct(id: $id, pharmacistId: $pharmacistId, categoryId: $categoryId, name: $name, description: $description, archived: $archived, variants: $variants, images: $images)';
}


}

/// @nodoc
abstract mixin class _$ManagedProductCopyWith<$Res> implements $ManagedProductCopyWith<$Res> {
  factory _$ManagedProductCopyWith(_ManagedProduct value, $Res Function(_ManagedProduct) _then) = __$ManagedProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String pharmacistId, String? categoryId, String name, String description, bool archived, List<Variant> variants, List<String> images
});




}
/// @nodoc
class __$ManagedProductCopyWithImpl<$Res>
    implements _$ManagedProductCopyWith<$Res> {
  __$ManagedProductCopyWithImpl(this._self, this._then);

  final _ManagedProduct _self;
  final $Res Function(_ManagedProduct) _then;

/// Create a copy of ManagedProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pharmacistId = null,Object? categoryId = freezed,Object? name = null,Object? description = null,Object? archived = null,Object? variants = null,Object? images = null,}) {
  return _then(_ManagedProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pharmacistId: null == pharmacistId ? _self.pharmacistId : pharmacistId // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variant>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$VariantInput {

@JsonKey(includeIfNull: false) String? get id; num get purity; String get sizeLabel;@MoneyConverter() Money get price; int get stock; bool get archived;
/// Create a copy of VariantInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantInputCopyWith<VariantInput> get copyWith => _$VariantInputCopyWithImpl<VariantInput>(this as VariantInput, _$identity);

  /// Serializes this VariantInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VariantInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariantInput&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.purity, _this.purity) || other.purity == _this.purity)&&(identical(other.sizeLabel, _this.sizeLabel) || other.sizeLabel == _this.sizeLabel)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.stock, _this.stock) || other.stock == _this.stock)&&(identical(other.archived, _this.archived) || other.archived == _this.archived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VariantInput;
  return Object.hash(runtimeType,_this.id,_this.purity,_this.sizeLabel,_this.price,_this.stock,_this.archived);
}

@override
String toString() {
  final _this = this as VariantInput;
  return 'VariantInput(id: ${_this.id}, purity: ${_this.purity}, sizeLabel: ${_this.sizeLabel}, price: ${_this.price}, stock: ${_this.stock}, archived: ${_this.archived})';
}


}

/// @nodoc
abstract mixin class $VariantInputCopyWith<$Res>  {
  factory $VariantInputCopyWith(VariantInput value, $Res Function(VariantInput) _then) = _$VariantInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, num purity, String sizeLabel,@MoneyConverter() Money price, int stock, bool archived
});




}
/// @nodoc
class _$VariantInputCopyWithImpl<$Res>
    implements $VariantInputCopyWith<$Res> {
  _$VariantInputCopyWithImpl(this._self, this._then);

  final VariantInput _self;
  final $Res Function(VariantInput) _then;

/// Create a copy of VariantInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? purity = null,Object? sizeLabel = null,Object? price = null,Object? stock = null,Object? archived = null,}) {
  return _then(VariantInput(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,purity: null == purity ? _self.purity : purity // ignore: cast_nullable_to_non_nullable
as num,sizeLabel: null == sizeLabel ? _self.sizeLabel : sizeLabel // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VariantInput].
extension VariantInputPatterns on VariantInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VariantInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VariantInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VariantInput value)  $default,){
final _that = this;
switch (_that) {
case _VariantInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VariantInput value)?  $default,){
final _that = this;
switch (_that) {
case _VariantInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  num purity,  String sizeLabel, @MoneyConverter()  Money price,  int stock,  bool archived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VariantInput() when $default != null:
return $default(_that.id,_that.purity,_that.sizeLabel,_that.price,_that.stock,_that.archived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  num purity,  String sizeLabel, @MoneyConverter()  Money price,  int stock,  bool archived)  $default,) {final _that = this;
switch (_that) {
case _VariantInput():
return $default(_that.id,_that.purity,_that.sizeLabel,_that.price,_that.stock,_that.archived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? id,  num purity,  String sizeLabel, @MoneyConverter()  Money price,  int stock,  bool archived)?  $default,) {final _that = this;
switch (_that) {
case _VariantInput() when $default != null:
return $default(_that.id,_that.purity,_that.sizeLabel,_that.price,_that.stock,_that.archived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VariantInput implements VariantInput {
  const _VariantInput({@JsonKey(includeIfNull: false) this.id, required this.purity, required this.sizeLabel, @MoneyConverter() required this.price, required this.stock, this.archived = false});
  factory _VariantInput.fromJson(Map<String, dynamic> json) => _$VariantInputFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? id;
@override final  num purity;
@override final  String sizeLabel;
@override@MoneyConverter() final  Money price;
@override final  int stock;
@override@JsonKey() final  bool archived;

/// Create a copy of VariantInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantInputCopyWith<_VariantInput> get copyWith => __$VariantInputCopyWithImpl<_VariantInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariantInputToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantInput&&(identical(other.id, id) || other.id == id)&&(identical(other.purity, purity) || other.purity == purity)&&(identical(other.sizeLabel, sizeLabel) || other.sizeLabel == sizeLabel)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.archived, archived) || other.archived == archived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,purity,sizeLabel,price,stock,archived);
}

@override
String toString() {
    return 'VariantInput(id: $id, purity: $purity, sizeLabel: $sizeLabel, price: $price, stock: $stock, archived: $archived)';
}


}

/// @nodoc
abstract mixin class _$VariantInputCopyWith<$Res> implements $VariantInputCopyWith<$Res> {
  factory _$VariantInputCopyWith(_VariantInput value, $Res Function(_VariantInput) _then) = __$VariantInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, num purity, String sizeLabel,@MoneyConverter() Money price, int stock, bool archived
});




}
/// @nodoc
class __$VariantInputCopyWithImpl<$Res>
    implements _$VariantInputCopyWith<$Res> {
  __$VariantInputCopyWithImpl(this._self, this._then);

  final _VariantInput _self;
  final $Res Function(_VariantInput) _then;

/// Create a copy of VariantInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? purity = null,Object? sizeLabel = null,Object? price = null,Object? stock = null,Object? archived = null,}) {
  return _then(_VariantInput(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,purity: null == purity ? _self.purity : purity // ignore: cast_nullable_to_non_nullable
as num,sizeLabel: null == sizeLabel ? _self.sizeLabel : sizeLabel // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ProductInput {

 String? get id; String get pharmacistId; String? get categoryId; String get name; String get description; List<VariantInput> get variants; List<File> get newImages; List<String> get removedImages;/// Final order of kept image paths.
 List<String> get imageOrder;
/// Create a copy of ProductInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductInputCopyWith<ProductInput> get copyWith => _$ProductInputCopyWithImpl<ProductInput>(this as ProductInput, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProductInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductInput&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.pharmacistId, _this.pharmacistId) || other.pharmacistId == _this.pharmacistId)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.variants, _this.variants)&&const DeepCollectionEquality().equals(other.newImages, _this.newImages)&&const DeepCollectionEquality().equals(other.removedImages, _this.removedImages)&&const DeepCollectionEquality().equals(other.imageOrder, _this.imageOrder));
}


@override
int get hashCode {
  final _this = this as ProductInput;
  return Object.hash(runtimeType,_this.id,_this.pharmacistId,_this.categoryId,_this.name,_this.description,const DeepCollectionEquality().hash(_this.variants),const DeepCollectionEquality().hash(_this.newImages),const DeepCollectionEquality().hash(_this.removedImages),const DeepCollectionEquality().hash(_this.imageOrder));
}

@override
String toString() {
  final _this = this as ProductInput;
  return 'ProductInput(id: ${_this.id}, pharmacistId: ${_this.pharmacistId}, categoryId: ${_this.categoryId}, name: ${_this.name}, description: ${_this.description}, variants: ${_this.variants}, newImages: ${_this.newImages}, removedImages: ${_this.removedImages}, imageOrder: ${_this.imageOrder})';
}


}

/// @nodoc
abstract mixin class $ProductInputCopyWith<$Res>  {
  factory $ProductInputCopyWith(ProductInput value, $Res Function(ProductInput) _then) = _$ProductInputCopyWithImpl;
@useResult
$Res call({
 String? id, String pharmacistId, String? categoryId, String name, String description, List<VariantInput> variants, List<File> newImages, List<String> removedImages, List<String> imageOrder
});




}
/// @nodoc
class _$ProductInputCopyWithImpl<$Res>
    implements $ProductInputCopyWith<$Res> {
  _$ProductInputCopyWithImpl(this._self, this._then);

  final ProductInput _self;
  final $Res Function(ProductInput) _then;

/// Create a copy of ProductInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? pharmacistId = null,Object? categoryId = freezed,Object? name = null,Object? description = null,Object? variants = null,Object? newImages = null,Object? removedImages = null,Object? imageOrder = null,}) {
  return _then(ProductInput(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,pharmacistId: null == pharmacistId ? _self.pharmacistId : pharmacistId // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<VariantInput>,newImages: null == newImages ? _self.newImages : newImages // ignore: cast_nullable_to_non_nullable
as List<File>,removedImages: null == removedImages ? _self.removedImages : removedImages // ignore: cast_nullable_to_non_nullable
as List<String>,imageOrder: null == imageOrder ? _self.imageOrder : imageOrder // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductInput].
extension ProductInputPatterns on ProductInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductInput value)  $default,){
final _that = this;
switch (_that) {
case _ProductInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductInput value)?  $default,){
final _that = this;
switch (_that) {
case _ProductInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String pharmacistId,  String? categoryId,  String name,  String description,  List<VariantInput> variants,  List<File> newImages,  List<String> removedImages,  List<String> imageOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductInput() when $default != null:
return $default(_that.id,_that.pharmacistId,_that.categoryId,_that.name,_that.description,_that.variants,_that.newImages,_that.removedImages,_that.imageOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String pharmacistId,  String? categoryId,  String name,  String description,  List<VariantInput> variants,  List<File> newImages,  List<String> removedImages,  List<String> imageOrder)  $default,) {final _that = this;
switch (_that) {
case _ProductInput():
return $default(_that.id,_that.pharmacistId,_that.categoryId,_that.name,_that.description,_that.variants,_that.newImages,_that.removedImages,_that.imageOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String pharmacistId,  String? categoryId,  String name,  String description,  List<VariantInput> variants,  List<File> newImages,  List<String> removedImages,  List<String> imageOrder)?  $default,) {final _that = this;
switch (_that) {
case _ProductInput() when $default != null:
return $default(_that.id,_that.pharmacistId,_that.categoryId,_that.name,_that.description,_that.variants,_that.newImages,_that.removedImages,_that.imageOrder);case _:
  return null;

}
}

}

/// @nodoc


class _ProductInput implements ProductInput {
  const _ProductInput({this.id, required this.pharmacistId, this.categoryId, required this.name, this.description = '',  List<VariantInput> variants = const <VariantInput>[],  List<File> newImages = const <File>[],  List<String> removedImages = const <String>[],  List<String> imageOrder = const <String>[]}): _variants = variants,_newImages = newImages,_removedImages = removedImages,_imageOrder = imageOrder;
  

@override final  String? id;
@override final  String pharmacistId;
@override final  String? categoryId;
@override final  String name;
@override@JsonKey() final  String description;
 final  List<VariantInput> _variants;
@override@JsonKey() List<VariantInput> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

 final  List<File> _newImages;
@override@JsonKey() List<File> get newImages {
  if (_newImages is EqualUnmodifiableListView) return _newImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newImages);
}

 final  List<String> _removedImages;
@override@JsonKey() List<String> get removedImages {
  if (_removedImages is EqualUnmodifiableListView) return _removedImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_removedImages);
}

/// Final order of kept image paths.
 final  List<String> _imageOrder;
/// Final order of kept image paths.
@override@JsonKey() List<String> get imageOrder {
  if (_imageOrder is EqualUnmodifiableListView) return _imageOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageOrder);
}


/// Create a copy of ProductInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductInputCopyWith<_ProductInput> get copyWith => __$ProductInputCopyWithImpl<_ProductInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductInput&&(identical(other.id, id) || other.id == id)&&(identical(other.pharmacistId, pharmacistId) || other.pharmacistId == pharmacistId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.variants, _variants)&&const DeepCollectionEquality().equals(other.newImages, _newImages)&&const DeepCollectionEquality().equals(other.removedImages, _removedImages)&&const DeepCollectionEquality().equals(other.imageOrder, _imageOrder));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,pharmacistId,categoryId,name,description,const DeepCollectionEquality().hash(_variants),const DeepCollectionEquality().hash(_newImages),const DeepCollectionEquality().hash(_removedImages),const DeepCollectionEquality().hash(_imageOrder));
}

@override
String toString() {
    return 'ProductInput(id: $id, pharmacistId: $pharmacistId, categoryId: $categoryId, name: $name, description: $description, variants: $variants, newImages: $newImages, removedImages: $removedImages, imageOrder: $imageOrder)';
}


}

/// @nodoc
abstract mixin class _$ProductInputCopyWith<$Res> implements $ProductInputCopyWith<$Res> {
  factory _$ProductInputCopyWith(_ProductInput value, $Res Function(_ProductInput) _then) = __$ProductInputCopyWithImpl;
@override @useResult
$Res call({
 String? id, String pharmacistId, String? categoryId, String name, String description, List<VariantInput> variants, List<File> newImages, List<String> removedImages, List<String> imageOrder
});




}
/// @nodoc
class __$ProductInputCopyWithImpl<$Res>
    implements _$ProductInputCopyWith<$Res> {
  __$ProductInputCopyWithImpl(this._self, this._then);

  final _ProductInput _self;
  final $Res Function(_ProductInput) _then;

/// Create a copy of ProductInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? pharmacistId = null,Object? categoryId = freezed,Object? name = null,Object? description = null,Object? variants = null,Object? newImages = null,Object? removedImages = null,Object? imageOrder = null,}) {
  return _then(_ProductInput(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,pharmacistId: null == pharmacistId ? _self.pharmacistId : pharmacistId // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<VariantInput>,newImages: null == newImages ? _self._newImages : newImages // ignore: cast_nullable_to_non_nullable
as List<File>,removedImages: null == removedImages ? _self._removedImages : removedImages // ignore: cast_nullable_to_non_nullable
as List<String>,imageOrder: null == imageOrder ? _self._imageOrder : imageOrder // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$LowStockVariant {

 String get variantId; String get productId; String get productName; String get variantLabel; int get stock;
/// Create a copy of LowStockVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockVariantCopyWith<LowStockVariant> get copyWith => _$LowStockVariantCopyWithImpl<LowStockVariant>(this as LowStockVariant, _$identity);

  /// Serializes this LowStockVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LowStockVariant;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockVariant&&(identical(other.variantId, _this.variantId) || other.variantId == _this.variantId)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.productName, _this.productName) || other.productName == _this.productName)&&(identical(other.variantLabel, _this.variantLabel) || other.variantLabel == _this.variantLabel)&&(identical(other.stock, _this.stock) || other.stock == _this.stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LowStockVariant;
  return Object.hash(runtimeType,_this.variantId,_this.productId,_this.productName,_this.variantLabel,_this.stock);
}

@override
String toString() {
  final _this = this as LowStockVariant;
  return 'LowStockVariant(variantId: ${_this.variantId}, productId: ${_this.productId}, productName: ${_this.productName}, variantLabel: ${_this.variantLabel}, stock: ${_this.stock})';
}


}

/// @nodoc
abstract mixin class $LowStockVariantCopyWith<$Res>  {
  factory $LowStockVariantCopyWith(LowStockVariant value, $Res Function(LowStockVariant) _then) = _$LowStockVariantCopyWithImpl;
@useResult
$Res call({
 String variantId, String productId, String productName, String variantLabel, int stock
});




}
/// @nodoc
class _$LowStockVariantCopyWithImpl<$Res>
    implements $LowStockVariantCopyWith<$Res> {
  _$LowStockVariantCopyWithImpl(this._self, this._then);

  final LowStockVariant _self;
  final $Res Function(LowStockVariant) _then;

/// Create a copy of LowStockVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? productId = null,Object? productName = null,Object? variantLabel = null,Object? stock = null,}) {
  return _then(LowStockVariant(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LowStockVariant].
extension LowStockVariantPatterns on LowStockVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockVariant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockVariant value)  $default,){
final _that = this;
switch (_that) {
case _LowStockVariant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockVariant value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockVariant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String variantId,  String productId,  String productName,  String variantLabel,  int stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockVariant() when $default != null:
return $default(_that.variantId,_that.productId,_that.productName,_that.variantLabel,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String variantId,  String productId,  String productName,  String variantLabel,  int stock)  $default,) {final _that = this;
switch (_that) {
case _LowStockVariant():
return $default(_that.variantId,_that.productId,_that.productName,_that.variantLabel,_that.stock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String variantId,  String productId,  String productName,  String variantLabel,  int stock)?  $default,) {final _that = this;
switch (_that) {
case _LowStockVariant() when $default != null:
return $default(_that.variantId,_that.productId,_that.productName,_that.variantLabel,_that.stock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockVariant implements LowStockVariant {
  const _LowStockVariant({required this.variantId, required this.productId, required this.productName, required this.variantLabel, required this.stock});
  factory _LowStockVariant.fromJson(Map<String, dynamic> json) => _$LowStockVariantFromJson(json);

@override final  String variantId;
@override final  String productId;
@override final  String productName;
@override final  String variantLabel;
@override final  int stock;

/// Create a copy of LowStockVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockVariantCopyWith<_LowStockVariant> get copyWith => __$LowStockVariantCopyWithImpl<_LowStockVariant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockVariantToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockVariant&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,variantId,productId,productName,variantLabel,stock);
}

@override
String toString() {
    return 'LowStockVariant(variantId: $variantId, productId: $productId, productName: $productName, variantLabel: $variantLabel, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$LowStockVariantCopyWith<$Res> implements $LowStockVariantCopyWith<$Res> {
  factory _$LowStockVariantCopyWith(_LowStockVariant value, $Res Function(_LowStockVariant) _then) = __$LowStockVariantCopyWithImpl;
@override @useResult
$Res call({
 String variantId, String productId, String productName, String variantLabel, int stock
});




}
/// @nodoc
class __$LowStockVariantCopyWithImpl<$Res>
    implements _$LowStockVariantCopyWith<$Res> {
  __$LowStockVariantCopyWithImpl(this._self, this._then);

  final _LowStockVariant _self;
  final $Res Function(_LowStockVariant) _then;

/// Create a copy of LowStockVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? productId = null,Object? productName = null,Object? variantLabel = null,Object? stock = null,}) {
  return _then(_LowStockVariant(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CategoryInput {

@JsonKey(includeIfNull: false) String? get id; String get name; String? get icon;
/// Create a copy of CategoryInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryInputCopyWith<CategoryInput> get copyWith => _$CategoryInputCopyWithImpl<CategoryInput>(this as CategoryInput, _$identity);

  /// Serializes this CategoryInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CategoryInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryInput&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.icon, _this.icon) || other.icon == _this.icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CategoryInput;
  return Object.hash(runtimeType,_this.id,_this.name,_this.icon);
}

@override
String toString() {
  final _this = this as CategoryInput;
  return 'CategoryInput(id: ${_this.id}, name: ${_this.name}, icon: ${_this.icon})';
}


}

/// @nodoc
abstract mixin class $CategoryInputCopyWith<$Res>  {
  factory $CategoryInputCopyWith(CategoryInput value, $Res Function(CategoryInput) _then) = _$CategoryInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, String name, String? icon
});




}
/// @nodoc
class _$CategoryInputCopyWithImpl<$Res>
    implements $CategoryInputCopyWith<$Res> {
  _$CategoryInputCopyWithImpl(this._self, this._then);

  final CategoryInput _self;
  final $Res Function(CategoryInput) _then;

/// Create a copy of CategoryInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? icon = freezed,}) {
  return _then(CategoryInput(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryInput].
extension CategoryInputPatterns on CategoryInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryInput value)  $default,){
final _that = this;
switch (_that) {
case _CategoryInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryInput value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  String name,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryInput() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  String name,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _CategoryInput():
return $default(_that.id,_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? id,  String name,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _CategoryInput() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryInput implements CategoryInput {
  const _CategoryInput({@JsonKey(includeIfNull: false) this.id, required this.name, this.icon});
  factory _CategoryInput.fromJson(Map<String, dynamic> json) => _$CategoryInputFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? id;
@override final  String name;
@override final  String? icon;

/// Create a copy of CategoryInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryInputCopyWith<_CategoryInput> get copyWith => __$CategoryInputCopyWithImpl<_CategoryInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryInputToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryInput&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,icon);
}

@override
String toString() {
    return 'CategoryInput(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$CategoryInputCopyWith<$Res> implements $CategoryInputCopyWith<$Res> {
  factory _$CategoryInputCopyWith(_CategoryInput value, $Res Function(_CategoryInput) _then) = __$CategoryInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, String name, String? icon
});




}
/// @nodoc
class __$CategoryInputCopyWithImpl<$Res>
    implements _$CategoryInputCopyWith<$Res> {
  __$CategoryInputCopyWithImpl(this._self, this._then);

  final _CategoryInput _self;
  final $Res Function(_CategoryInput) _then;

/// Create a copy of CategoryInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? icon = freezed,}) {
  return _then(_CategoryInput(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
