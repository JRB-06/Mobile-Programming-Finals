// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: json['id'] as String,
  email: json['email'] as String,
  fullName: json['full_name'] as String,
  phone: json['phone'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  role:
      $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.customer,
  isBanned: json['is_banned'] as bool? ?? false,
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'full_name': instance.fullName,
  'phone': instance.phone,
  'avatar_url': instance.avatarUrl,
  'role': _$UserRoleEnumMap[instance.role]!,
  'is_banned': instance.isBanned,
};

const _$UserRoleEnumMap = {
  UserRole.customer: 'customer',
  UserRole.admin: 'admin',
};
