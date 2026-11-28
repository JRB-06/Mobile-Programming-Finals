import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum Tier {
  street,
  pharma,
  blueSky;

  static Tier fromPurity(num purity) {
    if (!(purity >= 0 && purity <= 100)) {
      throw ArgumentError.value(purity, 'purity', 'must be between 0 and 100');
    }
    if (purity < 80) return street;
    if (purity < 99) return pharma;
    return blueSky;
  }
}
