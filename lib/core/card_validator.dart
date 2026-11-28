enum CardBrand { visa, mastercard, amex }

enum CardField { number, expiry, cvv }

sealed class CardCheck {
  const CardCheck();
}

final class CardValid extends CardCheck {
  const CardValid({required this.brand, required this.last4});

  final CardBrand brand;
  final String last4;

  @override
  bool operator ==(Object other) =>
      other is CardValid && other.brand == brand && other.last4 == last4;

  @override
  int get hashCode => Object.hash(brand, last4);
}

final class CardInvalid extends CardCheck {
  const CardInvalid({required this.field, required this.message});

  final CardField field;
  final String message;

  @override
  bool operator ==(Object other) =>
      other is CardInvalid && other.field == field && other.message == message;

  @override
  int get hashCode => Object.hash(field, message);
}

CardCheck checkCard(
  String number,
  int expMonth,
  int expYear,
  String cvv, {
  DateTime? now,
}) {
  final digits = number.replaceAll(RegExp(r'[ -]'), '');
  if (!RegExp(r'^\d+$').hasMatch(digits)) {
    return const CardInvalid(
      field: CardField.number,
      message: 'Card number is invalid',
    );
  }
  final brand = _brandOf(digits);
  if (brand == null || !_luhnOk(digits)) {
    return const CardInvalid(
      field: CardField.number,
      message: 'Card number is invalid',
    );
  }
  if (expMonth < 1 || expMonth > 12) {
    return const CardInvalid(
      field: CardField.expiry,
      message: 'Expiry month is invalid',
    );
  }
  final year = expYear < 100 ? 2000 + expYear : expYear;
  if (!(now ?? DateTime.now()).isBefore(DateTime(year, expMonth + 1))) {
    return const CardInvalid(
      field: CardField.expiry,
      message: 'Card has expired',
    );
  }
  if (!RegExp(r'^\d{3,4}$').hasMatch(cvv)) {
    return const CardInvalid(
      field: CardField.cvv,
      message: 'CVV must be 3 or 4 digits',
    );
  }
  return CardValid(brand: brand, last4: digits.substring(digits.length - 4));
}

CardBrand? _brandOf(String digits) {
  final n = digits.length;
  if (digits.startsWith('4') && (n == 13 || n == 16 || n == 19)) {
    return CardBrand.visa;
  }
  if (RegExp(r'^5[1-5]').hasMatch(digits) && n == 16) {
    return CardBrand.mastercard;
  }
  if (RegExp(r'^3[47]').hasMatch(digits) && n == 15) return CardBrand.amex;
  return null;
}

bool _luhnOk(String digits) {
  var sum = 0;
  for (var i = 0; i < digits.length; i++) {
    var d = int.parse(digits[digits.length - 1 - i]);
    if (i.isOdd) {
      d *= 2;
      if (d > 9) d -= 9;
    }
    sum += d;
  }
  return sum % 10 == 0;
}
