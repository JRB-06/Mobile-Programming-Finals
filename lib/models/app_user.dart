import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

enum UserRole {
  customer,
  admin;

  static UserRole fromDb(String v) => values.byName(v);
  String get db => name;
}

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String email,
    required String fullName,
    String? phone,
    String? avatarUrl,
    @Default(UserRole.customer) UserRole role,
    @Default(false) bool isBanned,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
