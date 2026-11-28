// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Address {

 String get id; String get label; String get line1; String? get line2; String get city; String get province; String get postalCode; String get country; bool get isDefault;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Address;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.line1, _this.line1) || other.line1 == _this.line1)&&(identical(other.line2, _this.line2) || other.line2 == _this.line2)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.province, _this.province) || other.province == _this.province)&&(identical(other.postalCode, _this.postalCode) || other.postalCode == _this.postalCode)&&(identical(other.country, _this.country) || other.country == _this.country)&&(identical(other.isDefault, _this.isDefault) || other.isDefault == _this.isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Address;
  return Object.hash(runtimeType,_this.id,_this.label,_this.line1,_this.line2,_this.city,_this.province,_this.postalCode,_this.country,_this.isDefault);
}

@override
String toString() {
  final _this = this as Address;
  return 'Address(id: ${_this.id}, label: ${_this.label}, line1: ${_this.line1}, line2: ${_this.line2}, city: ${_this.city}, province: ${_this.province}, postalCode: ${_this.postalCode}, country: ${_this.country}, isDefault: ${_this.isDefault})';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 String id, String label, String line1, String? line2, String city, String province, String postalCode, String country, bool isDefault
});




}
/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? line1 = null,Object? line2 = freezed,Object? city = null,Object? province = null,Object? postalCode = null,Object? country = null,Object? isDefault = null,}) {
  return _then(Address(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,line1: null == line1 ? _self.line1 : line1 // ignore: cast_nullable_to_non_nullable
as String,line2: freezed == line2 ? _self.line2 : line2 // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Address].
extension AddressPatterns on Address {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Address value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Address value)  $default,){
final _that = this;
switch (_that) {
case _Address():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Address value)?  $default,){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String line1,  String? line2,  String city,  String province,  String postalCode,  String country,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.label,_that.line1,_that.line2,_that.city,_that.province,_that.postalCode,_that.country,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String line1,  String? line2,  String city,  String province,  String postalCode,  String country,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _Address():
return $default(_that.id,_that.label,_that.line1,_that.line2,_that.city,_that.province,_that.postalCode,_that.country,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String line1,  String? line2,  String city,  String province,  String postalCode,  String country,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.label,_that.line1,_that.line2,_that.city,_that.province,_that.postalCode,_that.country,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Address implements Address {
  const _Address({required this.id, required this.label, required this.line1, this.line2, required this.city, required this.province, required this.postalCode, this.country = 'Philippines', this.isDefault = false});
  factory _Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

@override final  String id;
@override final  String label;
@override final  String line1;
@override final  String? line2;
@override final  String city;
@override final  String province;
@override final  String postalCode;
@override@JsonKey() final  String country;
@override@JsonKey() final  bool isDefault;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressCopyWith<_Address> get copyWith => __$AddressCopyWithImpl<_Address>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.line1, line1) || other.line1 == line1)&&(identical(other.line2, line2) || other.line2 == line2)&&(identical(other.city, city) || other.city == city)&&(identical(other.province, province) || other.province == province)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.country, country) || other.country == country)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,line1,line2,city,province,postalCode,country,isDefault);
}

@override
String toString() {
    return 'Address(id: $id, label: $label, line1: $line1, line2: $line2, city: $city, province: $province, postalCode: $postalCode, country: $country, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String line1, String? line2, String city, String province, String postalCode, String country, bool isDefault
});




}
/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? line1 = null,Object? line2 = freezed,Object? city = null,Object? province = null,Object? postalCode = null,Object? country = null,Object? isDefault = null,}) {
  return _then(_Address(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,line1: null == line1 ? _self.line1 : line1 // ignore: cast_nullable_to_non_nullable
as String,line2: freezed == line2 ? _self.line2 : line2 // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AddressInput {

@JsonKey(includeIfNull: false) String? get id; String get label; String get line1; String? get line2; String get city; String get province; String get postalCode; String get country; bool get isDefault;
/// Create a copy of AddressInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressInputCopyWith<AddressInput> get copyWith => _$AddressInputCopyWithImpl<AddressInput>(this as AddressInput, _$identity);

  /// Serializes this AddressInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AddressInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressInput&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.line1, _this.line1) || other.line1 == _this.line1)&&(identical(other.line2, _this.line2) || other.line2 == _this.line2)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.province, _this.province) || other.province == _this.province)&&(identical(other.postalCode, _this.postalCode) || other.postalCode == _this.postalCode)&&(identical(other.country, _this.country) || other.country == _this.country)&&(identical(other.isDefault, _this.isDefault) || other.isDefault == _this.isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AddressInput;
  return Object.hash(runtimeType,_this.id,_this.label,_this.line1,_this.line2,_this.city,_this.province,_this.postalCode,_this.country,_this.isDefault);
}

@override
String toString() {
  final _this = this as AddressInput;
  return 'AddressInput(id: ${_this.id}, label: ${_this.label}, line1: ${_this.line1}, line2: ${_this.line2}, city: ${_this.city}, province: ${_this.province}, postalCode: ${_this.postalCode}, country: ${_this.country}, isDefault: ${_this.isDefault})';
}


}

/// @nodoc
abstract mixin class $AddressInputCopyWith<$Res>  {
  factory $AddressInputCopyWith(AddressInput value, $Res Function(AddressInput) _then) = _$AddressInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, String label, String line1, String? line2, String city, String province, String postalCode, String country, bool isDefault
});




}
/// @nodoc
class _$AddressInputCopyWithImpl<$Res>
    implements $AddressInputCopyWith<$Res> {
  _$AddressInputCopyWithImpl(this._self, this._then);

  final AddressInput _self;
  final $Res Function(AddressInput) _then;

/// Create a copy of AddressInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? label = null,Object? line1 = null,Object? line2 = freezed,Object? city = null,Object? province = null,Object? postalCode = null,Object? country = null,Object? isDefault = null,}) {
  return _then(AddressInput(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,line1: null == line1 ? _self.line1 : line1 // ignore: cast_nullable_to_non_nullable
as String,line2: freezed == line2 ? _self.line2 : line2 // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressInput].
extension AddressInputPatterns on AddressInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressInput value)  $default,){
final _that = this;
switch (_that) {
case _AddressInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressInput value)?  $default,){
final _that = this;
switch (_that) {
case _AddressInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  String label,  String line1,  String? line2,  String city,  String province,  String postalCode,  String country,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressInput() when $default != null:
return $default(_that.id,_that.label,_that.line1,_that.line2,_that.city,_that.province,_that.postalCode,_that.country,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  String label,  String line1,  String? line2,  String city,  String province,  String postalCode,  String country,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _AddressInput():
return $default(_that.id,_that.label,_that.line1,_that.line2,_that.city,_that.province,_that.postalCode,_that.country,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? id,  String label,  String line1,  String? line2,  String city,  String province,  String postalCode,  String country,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _AddressInput() when $default != null:
return $default(_that.id,_that.label,_that.line1,_that.line2,_that.city,_that.province,_that.postalCode,_that.country,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressInput implements AddressInput {
  const _AddressInput({@JsonKey(includeIfNull: false) this.id, required this.label, required this.line1, this.line2, required this.city, required this.province, required this.postalCode, this.country = 'Philippines', this.isDefault = false});
  factory _AddressInput.fromJson(Map<String, dynamic> json) => _$AddressInputFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? id;
@override final  String label;
@override final  String line1;
@override final  String? line2;
@override final  String city;
@override final  String province;
@override final  String postalCode;
@override@JsonKey() final  String country;
@override@JsonKey() final  bool isDefault;

/// Create a copy of AddressInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressInputCopyWith<_AddressInput> get copyWith => __$AddressInputCopyWithImpl<_AddressInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressInputToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressInput&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.line1, line1) || other.line1 == line1)&&(identical(other.line2, line2) || other.line2 == line2)&&(identical(other.city, city) || other.city == city)&&(identical(other.province, province) || other.province == province)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.country, country) || other.country == country)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,line1,line2,city,province,postalCode,country,isDefault);
}

@override
String toString() {
    return 'AddressInput(id: $id, label: $label, line1: $line1, line2: $line2, city: $city, province: $province, postalCode: $postalCode, country: $country, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$AddressInputCopyWith<$Res> implements $AddressInputCopyWith<$Res> {
  factory _$AddressInputCopyWith(_AddressInput value, $Res Function(_AddressInput) _then) = __$AddressInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, String label, String line1, String? line2, String city, String province, String postalCode, String country, bool isDefault
});




}
/// @nodoc
class __$AddressInputCopyWithImpl<$Res>
    implements _$AddressInputCopyWith<$Res> {
  __$AddressInputCopyWithImpl(this._self, this._then);

  final _AddressInput _self;
  final $Res Function(_AddressInput) _then;

/// Create a copy of AddressInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? label = null,Object? line1 = null,Object? line2 = freezed,Object? city = null,Object? province = null,Object? postalCode = null,Object? country = null,Object? isDefault = null,}) {
  return _then(_AddressInput(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,line1: null == line1 ? _self.line1 : line1 // ignore: cast_nullable_to_non_nullable
as String,line2: freezed == line2 ? _self.line2 : line2 // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SavedCard {

 String get id; CardBrand get brand; String get last4; int get expMonth; int get expYear; bool get isDefault;
/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedCardCopyWith<SavedCard> get copyWith => _$SavedCardCopyWithImpl<SavedCard>(this as SavedCard, _$identity);

  /// Serializes this SavedCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SavedCard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedCard&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.last4, _this.last4) || other.last4 == _this.last4)&&(identical(other.expMonth, _this.expMonth) || other.expMonth == _this.expMonth)&&(identical(other.expYear, _this.expYear) || other.expYear == _this.expYear)&&(identical(other.isDefault, _this.isDefault) || other.isDefault == _this.isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SavedCard;
  return Object.hash(runtimeType,_this.id,_this.brand,_this.last4,_this.expMonth,_this.expYear,_this.isDefault);
}

@override
String toString() {
  final _this = this as SavedCard;
  return 'SavedCard(id: ${_this.id}, brand: ${_this.brand}, last4: ${_this.last4}, expMonth: ${_this.expMonth}, expYear: ${_this.expYear}, isDefault: ${_this.isDefault})';
}


}

/// @nodoc
abstract mixin class $SavedCardCopyWith<$Res>  {
  factory $SavedCardCopyWith(SavedCard value, $Res Function(SavedCard) _then) = _$SavedCardCopyWithImpl;
@useResult
$Res call({
 String id, CardBrand brand, String last4, int expMonth, int expYear, bool isDefault
});




}
/// @nodoc
class _$SavedCardCopyWithImpl<$Res>
    implements $SavedCardCopyWith<$Res> {
  _$SavedCardCopyWithImpl(this._self, this._then);

  final SavedCard _self;
  final $Res Function(SavedCard) _then;

/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brand = null,Object? last4 = null,Object? expMonth = null,Object? expYear = null,Object? isDefault = null,}) {
  return _then(SavedCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as CardBrand,last4: null == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String,expMonth: null == expMonth ? _self.expMonth : expMonth // ignore: cast_nullable_to_non_nullable
as int,expYear: null == expYear ? _self.expYear : expYear // ignore: cast_nullable_to_non_nullable
as int,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedCard].
extension SavedCardPatterns on SavedCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedCard value)  $default,){
final _that = this;
switch (_that) {
case _SavedCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedCard value)?  $default,){
final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  CardBrand brand,  String last4,  int expMonth,  int expYear,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
return $default(_that.id,_that.brand,_that.last4,_that.expMonth,_that.expYear,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  CardBrand brand,  String last4,  int expMonth,  int expYear,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _SavedCard():
return $default(_that.id,_that.brand,_that.last4,_that.expMonth,_that.expYear,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  CardBrand brand,  String last4,  int expMonth,  int expYear,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
return $default(_that.id,_that.brand,_that.last4,_that.expMonth,_that.expYear,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedCard implements SavedCard {
  const _SavedCard({required this.id, required this.brand, required this.last4, required this.expMonth, required this.expYear, this.isDefault = false});
  factory _SavedCard.fromJson(Map<String, dynamic> json) => _$SavedCardFromJson(json);

@override final  String id;
@override final  CardBrand brand;
@override final  String last4;
@override final  int expMonth;
@override final  int expYear;
@override@JsonKey() final  bool isDefault;

/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedCardCopyWith<_SavedCard> get copyWith => __$SavedCardCopyWithImpl<_SavedCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedCardToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedCard&&(identical(other.id, id) || other.id == id)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.expMonth, expMonth) || other.expMonth == expMonth)&&(identical(other.expYear, expYear) || other.expYear == expYear)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,brand,last4,expMonth,expYear,isDefault);
}

@override
String toString() {
    return 'SavedCard(id: $id, brand: $brand, last4: $last4, expMonth: $expMonth, expYear: $expYear, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$SavedCardCopyWith<$Res> implements $SavedCardCopyWith<$Res> {
  factory _$SavedCardCopyWith(_SavedCard value, $Res Function(_SavedCard) _then) = __$SavedCardCopyWithImpl;
@override @useResult
$Res call({
 String id, CardBrand brand, String last4, int expMonth, int expYear, bool isDefault
});




}
/// @nodoc
class __$SavedCardCopyWithImpl<$Res>
    implements _$SavedCardCopyWith<$Res> {
  __$SavedCardCopyWithImpl(this._self, this._then);

  final _SavedCard _self;
  final $Res Function(_SavedCard) _then;

/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brand = null,Object? last4 = null,Object? expMonth = null,Object? expYear = null,Object? isDefault = null,}) {
  return _then(_SavedCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as CardBrand,last4: null == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String,expMonth: null == expMonth ? _self.expMonth : expMonth // ignore: cast_nullable_to_non_nullable
as int,expYear: null == expYear ? _self.expYear : expYear // ignore: cast_nullable_to_non_nullable
as int,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$CardInput {

 String get number; int get expMonth; int get expYear; String get cvv;
/// Create a copy of CardInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardInputCopyWith<CardInput> get copyWith => _$CardInputCopyWithImpl<CardInput>(this as CardInput, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CardInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardInput&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.expMonth, _this.expMonth) || other.expMonth == _this.expMonth)&&(identical(other.expYear, _this.expYear) || other.expYear == _this.expYear)&&(identical(other.cvv, _this.cvv) || other.cvv == _this.cvv));
}


@override
int get hashCode {
  final _this = this as CardInput;
  return Object.hash(runtimeType,_this.number,_this.expMonth,_this.expYear,_this.cvv);
}



}

/// @nodoc
abstract mixin class $CardInputCopyWith<$Res>  {
  factory $CardInputCopyWith(CardInput value, $Res Function(CardInput) _then) = _$CardInputCopyWithImpl;
@useResult
$Res call({
 String number, int expMonth, int expYear, String cvv
});




}
/// @nodoc
class _$CardInputCopyWithImpl<$Res>
    implements $CardInputCopyWith<$Res> {
  _$CardInputCopyWithImpl(this._self, this._then);

  final CardInput _self;
  final $Res Function(CardInput) _then;

/// Create a copy of CardInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? expMonth = null,Object? expYear = null,Object? cvv = null,}) {
  return _then(CardInput(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,expMonth: null == expMonth ? _self.expMonth : expMonth // ignore: cast_nullable_to_non_nullable
as int,expYear: null == expYear ? _self.expYear : expYear // ignore: cast_nullable_to_non_nullable
as int,cvv: null == cvv ? _self.cvv : cvv // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CardInput].
extension CardInputPatterns on CardInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardInput value)  $default,){
final _that = this;
switch (_that) {
case _CardInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardInput value)?  $default,){
final _that = this;
switch (_that) {
case _CardInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  int expMonth,  int expYear,  String cvv)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardInput() when $default != null:
return $default(_that.number,_that.expMonth,_that.expYear,_that.cvv);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  int expMonth,  int expYear,  String cvv)  $default,) {final _that = this;
switch (_that) {
case _CardInput():
return $default(_that.number,_that.expMonth,_that.expYear,_that.cvv);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  int expMonth,  int expYear,  String cvv)?  $default,) {final _that = this;
switch (_that) {
case _CardInput() when $default != null:
return $default(_that.number,_that.expMonth,_that.expYear,_that.cvv);case _:
  return null;

}
}

}

/// @nodoc


class _CardInput extends CardInput {
  const _CardInput({required this.number, required this.expMonth, required this.expYear, required this.cvv}): super._();
  

@override final  String number;
@override final  int expMonth;
@override final  int expYear;
@override final  String cvv;

/// Create a copy of CardInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardInputCopyWith<_CardInput> get copyWith => __$CardInputCopyWithImpl<_CardInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardInput&&(identical(other.number, number) || other.number == number)&&(identical(other.expMonth, expMonth) || other.expMonth == expMonth)&&(identical(other.expYear, expYear) || other.expYear == expYear)&&(identical(other.cvv, cvv) || other.cvv == cvv));
}


@override
int get hashCode {
    return Object.hash(runtimeType,number,expMonth,expYear,cvv);
}



}

/// @nodoc
abstract mixin class _$CardInputCopyWith<$Res> implements $CardInputCopyWith<$Res> {
  factory _$CardInputCopyWith(_CardInput value, $Res Function(_CardInput) _then) = __$CardInputCopyWithImpl;
@override @useResult
$Res call({
 String number, int expMonth, int expYear, String cvv
});




}
/// @nodoc
class __$CardInputCopyWithImpl<$Res>
    implements _$CardInputCopyWith<$Res> {
  __$CardInputCopyWithImpl(this._self, this._then);

  final _CardInput _self;
  final $Res Function(_CardInput) _then;

/// Create a copy of CardInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? expMonth = null,Object? expYear = null,Object? cvv = null,}) {
  return _then(_CardInput(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,expMonth: null == expMonth ? _self.expMonth : expMonth // ignore: cast_nullable_to_non_nullable
as int,expYear: null == expYear ? _self.expYear : expYear // ignore: cast_nullable_to_non_nullable
as int,cvv: null == cvv ? _self.cvv : cvv // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
