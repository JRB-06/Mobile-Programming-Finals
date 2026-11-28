// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pharmacist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pharmacist {

 String get id; String get name; String get photoUrl; String? get specialty; bool get archived;
/// Create a copy of Pharmacist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacistCopyWith<Pharmacist> get copyWith => _$PharmacistCopyWithImpl<Pharmacist>(this as Pharmacist, _$identity);

  /// Serializes this Pharmacist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Pharmacist;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pharmacist&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.specialty, _this.specialty) || other.specialty == _this.specialty)&&(identical(other.archived, _this.archived) || other.archived == _this.archived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Pharmacist;
  return Object.hash(runtimeType,_this.id,_this.name,_this.photoUrl,_this.specialty,_this.archived);
}

@override
String toString() {
  final _this = this as Pharmacist;
  return 'Pharmacist(id: ${_this.id}, name: ${_this.name}, photoUrl: ${_this.photoUrl}, specialty: ${_this.specialty}, archived: ${_this.archived})';
}


}

/// @nodoc
abstract mixin class $PharmacistCopyWith<$Res>  {
  factory $PharmacistCopyWith(Pharmacist value, $Res Function(Pharmacist) _then) = _$PharmacistCopyWithImpl;
@useResult
$Res call({
 String id, String name, String photoUrl, String? specialty, bool archived
});




}
/// @nodoc
class _$PharmacistCopyWithImpl<$Res>
    implements $PharmacistCopyWith<$Res> {
  _$PharmacistCopyWithImpl(this._self, this._then);

  final Pharmacist _self;
  final $Res Function(Pharmacist) _then;

/// Create a copy of Pharmacist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? photoUrl = null,Object? specialty = freezed,Object? archived = null,}) {
  return _then(Pharmacist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,specialty: freezed == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String?,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Pharmacist].
extension PharmacistPatterns on Pharmacist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pharmacist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pharmacist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pharmacist value)  $default,){
final _that = this;
switch (_that) {
case _Pharmacist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pharmacist value)?  $default,){
final _that = this;
switch (_that) {
case _Pharmacist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String photoUrl,  String? specialty,  bool archived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pharmacist() when $default != null:
return $default(_that.id,_that.name,_that.photoUrl,_that.specialty,_that.archived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String photoUrl,  String? specialty,  bool archived)  $default,) {final _that = this;
switch (_that) {
case _Pharmacist():
return $default(_that.id,_that.name,_that.photoUrl,_that.specialty,_that.archived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String photoUrl,  String? specialty,  bool archived)?  $default,) {final _that = this;
switch (_that) {
case _Pharmacist() when $default != null:
return $default(_that.id,_that.name,_that.photoUrl,_that.specialty,_that.archived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pharmacist implements Pharmacist {
  const _Pharmacist({required this.id, required this.name, required this.photoUrl, this.specialty, this.archived = false});
  factory _Pharmacist.fromJson(Map<String, dynamic> json) => _$PharmacistFromJson(json);

@override final  String id;
@override final  String name;
@override final  String photoUrl;
@override final  String? specialty;
@override@JsonKey() final  bool archived;

/// Create a copy of Pharmacist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PharmacistCopyWith<_Pharmacist> get copyWith => __$PharmacistCopyWithImpl<_Pharmacist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PharmacistToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pharmacist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.archived, archived) || other.archived == archived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,photoUrl,specialty,archived);
}

@override
String toString() {
    return 'Pharmacist(id: $id, name: $name, photoUrl: $photoUrl, specialty: $specialty, archived: $archived)';
}


}

/// @nodoc
abstract mixin class _$PharmacistCopyWith<$Res> implements $PharmacistCopyWith<$Res> {
  factory _$PharmacistCopyWith(_Pharmacist value, $Res Function(_Pharmacist) _then) = __$PharmacistCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String photoUrl, String? specialty, bool archived
});




}
/// @nodoc
class __$PharmacistCopyWithImpl<$Res>
    implements _$PharmacistCopyWith<$Res> {
  __$PharmacistCopyWithImpl(this._self, this._then);

  final _Pharmacist _self;
  final $Res Function(_Pharmacist) _then;

/// Create a copy of Pharmacist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? photoUrl = null,Object? specialty = freezed,Object? archived = null,}) {
  return _then(_Pharmacist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,specialty: freezed == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String?,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PharmacistInput {

@JsonKey(includeIfNull: false) String? get id; String get name; String get photoUrl; String? get specialty;
/// Create a copy of PharmacistInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacistInputCopyWith<PharmacistInput> get copyWith => _$PharmacistInputCopyWithImpl<PharmacistInput>(this as PharmacistInput, _$identity);

  /// Serializes this PharmacistInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PharmacistInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PharmacistInput&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.specialty, _this.specialty) || other.specialty == _this.specialty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PharmacistInput;
  return Object.hash(runtimeType,_this.id,_this.name,_this.photoUrl,_this.specialty);
}

@override
String toString() {
  final _this = this as PharmacistInput;
  return 'PharmacistInput(id: ${_this.id}, name: ${_this.name}, photoUrl: ${_this.photoUrl}, specialty: ${_this.specialty})';
}


}

/// @nodoc
abstract mixin class $PharmacistInputCopyWith<$Res>  {
  factory $PharmacistInputCopyWith(PharmacistInput value, $Res Function(PharmacistInput) _then) = _$PharmacistInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, String name, String photoUrl, String? specialty
});




}
/// @nodoc
class _$PharmacistInputCopyWithImpl<$Res>
    implements $PharmacistInputCopyWith<$Res> {
  _$PharmacistInputCopyWithImpl(this._self, this._then);

  final PharmacistInput _self;
  final $Res Function(PharmacistInput) _then;

/// Create a copy of PharmacistInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? photoUrl = null,Object? specialty = freezed,}) {
  return _then(PharmacistInput(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,specialty: freezed == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PharmacistInput].
extension PharmacistInputPatterns on PharmacistInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PharmacistInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PharmacistInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PharmacistInput value)  $default,){
final _that = this;
switch (_that) {
case _PharmacistInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PharmacistInput value)?  $default,){
final _that = this;
switch (_that) {
case _PharmacistInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  String name,  String photoUrl,  String? specialty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PharmacistInput() when $default != null:
return $default(_that.id,_that.name,_that.photoUrl,_that.specialty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  String name,  String photoUrl,  String? specialty)  $default,) {final _that = this;
switch (_that) {
case _PharmacistInput():
return $default(_that.id,_that.name,_that.photoUrl,_that.specialty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? id,  String name,  String photoUrl,  String? specialty)?  $default,) {final _that = this;
switch (_that) {
case _PharmacistInput() when $default != null:
return $default(_that.id,_that.name,_that.photoUrl,_that.specialty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PharmacistInput implements PharmacistInput {
  const _PharmacistInput({@JsonKey(includeIfNull: false) this.id, required this.name, required this.photoUrl, this.specialty});
  factory _PharmacistInput.fromJson(Map<String, dynamic> json) => _$PharmacistInputFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? id;
@override final  String name;
@override final  String photoUrl;
@override final  String? specialty;

/// Create a copy of PharmacistInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PharmacistInputCopyWith<_PharmacistInput> get copyWith => __$PharmacistInputCopyWithImpl<_PharmacistInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PharmacistInputToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PharmacistInput&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.specialty, specialty) || other.specialty == specialty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,photoUrl,specialty);
}

@override
String toString() {
    return 'PharmacistInput(id: $id, name: $name, photoUrl: $photoUrl, specialty: $specialty)';
}


}

/// @nodoc
abstract mixin class _$PharmacistInputCopyWith<$Res> implements $PharmacistInputCopyWith<$Res> {
  factory _$PharmacistInputCopyWith(_PharmacistInput value, $Res Function(_PharmacistInput) _then) = __$PharmacistInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, String name, String photoUrl, String? specialty
});




}
/// @nodoc
class __$PharmacistInputCopyWithImpl<$Res>
    implements _$PharmacistInputCopyWith<$Res> {
  __$PharmacistInputCopyWithImpl(this._self, this._then);

  final _PharmacistInput _self;
  final $Res Function(_PharmacistInput) _then;

/// Create a copy of PharmacistInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? photoUrl = null,Object? specialty = freezed,}) {
  return _then(_PharmacistInput(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,specialty: freezed == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
