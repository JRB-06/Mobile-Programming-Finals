// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pharmacist _$PharmacistFromJson(Map<String, dynamic> json) => _Pharmacist(
  id: json['id'] as String,
  name: json['name'] as String,
  photoUrl: json['photo_url'] as String,
  specialty: json['specialty'] as String?,
  archived: json['archived'] as bool? ?? false,
);

Map<String, dynamic> _$PharmacistToJson(_Pharmacist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'specialty': instance.specialty,
      'archived': instance.archived,
    };

_PharmacistInput _$PharmacistInputFromJson(Map<String, dynamic> json) =>
    _PharmacistInput(
      id: json['id'] as String?,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String,
      specialty: json['specialty'] as String?,
    );

Map<String, dynamic> _$PharmacistInputToJson(_PharmacistInput instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'specialty': instance.specialty,
    };
