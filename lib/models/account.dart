import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:los_pollos_hermanos/core/card_validator.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String id,
    required String label,
    required String line1,
    String? line2,
    required String city,
    required String province,
    required String postalCode,
    @Default('Philippines') String country,
    @Default(false) bool isDefault,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

/// id == null creates an Address; otherwise updates it.
@freezed
abstract class AddressInput with _$AddressInput {
  const factory AddressInput({
    @JsonKey(includeIfNull: false) String? id,
    required String label,
    required String line1,
    String? line2,
    required String city,
    required String province,
    required String postalCode,
    @Default('Philippines') String country,
    @Default(false) bool isDefault,
  }) = _AddressInput;

  factory AddressInput.fromJson(Map<String, dynamic> json) =>
      _$AddressInputFromJson(json);
}

/// Brand + last4 + expiry only. Never the full number or CVV.
@freezed
abstract class SavedCard with _$SavedCard {
  const factory SavedCard({
    required String id,
    required CardBrand brand,
    required String last4,
    required int expMonth,
    required int expYear,
    @Default(false) bool isDefault,
  }) = _SavedCard;

  factory SavedCard.fromJson(Map<String, dynamic> json) =>
      _$SavedCardFromJson(json);
}

/// Raw form input; never serialized.
@freezed
abstract class CardInput with _$CardInput {
  const CardInput._();

  const factory CardInput({
    required String number,
    required int expMonth,
    required int expYear,
    required String cvv,
  }) = _CardInput;

  /// Keeps the number and CVV out of logs.
  @override
  String toString() =>
      'CardInput(last4: ${number.length >= 4 ? number.substring(number.length - 4) : ''})';
}
