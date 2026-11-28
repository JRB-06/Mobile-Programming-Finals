import 'package:json_annotation/json_annotation.dart';
import 'package:los_pollos_hermanos/core/money.dart';

/// Reads Postgres numeric (String or num) and writes an exact "680.00" string.
class MoneyConverter implements JsonConverter<Money, Object> {
  const MoneyConverter();

  @override
  Money fromJson(Object json) => Money.parse(json);

  @override
  String toJson(Money m) {
    final abs = m.centavos.abs();
    final cents = (abs % 100).toString().padLeft(2, '0');
    return '${m.centavos < 0 ? '-' : ''}${abs ~/ 100}.$cents';
  }
}
