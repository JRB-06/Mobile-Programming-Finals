import 'package:freezed_annotation/freezed_annotation.dart';

part 'pharmacist.freezed.dart';
part 'pharmacist.g.dart';

@freezed
abstract class Pharmacist with _$Pharmacist {
  const factory Pharmacist({
    required String id,
    required String name,
    required String photoUrl,
    String? specialty,
    @Default(false) bool archived,
  }) = _Pharmacist;

  factory Pharmacist.fromJson(Map<String, dynamic> json) =>
      _$PharmacistFromJson(json);
}

/// id == null creates a Pharmacist; otherwise updates it.
@freezed
abstract class PharmacistInput with _$PharmacistInput {
  const factory PharmacistInput({
    @JsonKey(includeIfNull: false) String? id,
    required String name,
    required String photoUrl,
    String? specialty,
  }) = _PharmacistInput;

  factory PharmacistInput.fromJson(Map<String, dynamic> json) =>
      _$PharmacistInputFromJson(json);
}
