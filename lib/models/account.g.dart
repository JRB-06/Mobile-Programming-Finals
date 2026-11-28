// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  id: json['id'] as String,
  label: json['label'] as String,
  line1: json['line1'] as String,
  line2: json['line2'] as String?,
  city: json['city'] as String,
  province: json['province'] as String,
  postalCode: json['postal_code'] as String,
  country: json['country'] as String? ?? 'Philippines',
  isDefault: json['is_default'] as bool? ?? false,
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'line1': instance.line1,
  'line2': instance.line2,
  'city': instance.city,
  'province': instance.province,
  'postal_code': instance.postalCode,
  'country': instance.country,
  'is_default': instance.isDefault,
};

_AddressInput _$AddressInputFromJson(Map<String, dynamic> json) =>
    _AddressInput(
      id: json['id'] as String?,
      label: json['label'] as String,
      line1: json['line1'] as String,
      line2: json['line2'] as String?,
      city: json['city'] as String,
      province: json['province'] as String,
      postalCode: json['postal_code'] as String,
      country: json['country'] as String? ?? 'Philippines',
      isDefault: json['is_default'] as bool? ?? false,
    );

Map<String, dynamic> _$AddressInputToJson(_AddressInput instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'label': instance.label,
      'line1': instance.line1,
      'line2': instance.line2,
      'city': instance.city,
      'province': instance.province,
      'postal_code': instance.postalCode,
      'country': instance.country,
      'is_default': instance.isDefault,
    };

_SavedCard _$SavedCardFromJson(Map<String, dynamic> json) => _SavedCard(
  id: json['id'] as String,
  brand: $enumDecode(_$CardBrandEnumMap, json['brand']),
  last4: json['last4'] as String,
  expMonth: (json['exp_month'] as num).toInt(),
  expYear: (json['exp_year'] as num).toInt(),
  isDefault: json['is_default'] as bool? ?? false,
);

Map<String, dynamic> _$SavedCardToJson(_SavedCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': _$CardBrandEnumMap[instance.brand]!,
      'last4': instance.last4,
      'exp_month': instance.expMonth,
      'exp_year': instance.expYear,
      'is_default': instance.isDefault,
    };

const _$CardBrandEnumMap = {
  CardBrand.visa: 'visa',
  CardBrand.mastercard: 'mastercard',
  CardBrand.amex: 'amex',
};
