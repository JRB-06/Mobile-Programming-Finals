import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/card_validator.dart';

void main() {
  final now = DateTime(2026, 11, 28);
  test('visa number is valid and keeps its last 4 digits', () {
    final r =
        checkCard('4242424242424242', 12, 2030, '123', now: now) as CardValid;
    expect(r.brand, CardBrand.visa);
    expect(r.last4, '4242');
  });
  test('mastercard prefix 51 to 55 is detected', () {
    final r =
        checkCard('5555555555554444', 12, 2030, '123', now: now) as CardValid;
    expect(r.brand, CardBrand.mastercard);
    expect(r.last4, '4444');
  });
  test('amex prefix 34 or 37 is detected', () {
    final r =
        checkCard('378282246310005', 12, 2030, '1234', now: now) as CardValid;
    expect(r.brand, CardBrand.amex);
    expect(r.last4, '0005');
  });
  test('unknown prefix or wrong length is an invalid number', () {
    for (final bad in [
      '1234567890123456',
      '42424242424242',
      '42424242424242424',
    ]) {
      expect(
        (checkCard(bad, 12, 2030, '123', now: now) as CardInvalid).field,
        CardField.number,
        reason: bad,
      );
    }
  });
  test('a number failing the Luhn check is an invalid number', () {
    expect(
      (checkCard(
        '4242424242424241',
        12,
        2030,
        '123',
        now: now,
      ) as CardInvalid).field,
      CardField.number,
    );
  });
  test(
    'spaces and dashes are stripped and other characters are not digits',
    () {
      expect(
        checkCard('4242 4242-4242 4242', 12, 2030, '123', now: now),
        isA<CardValid>(),
      );
      expect(
        (checkCard(
          '4242a24242424242',
          12,
          2030,
          '123',
          now: now,
        ) as CardInvalid).field,
        CardField.number,
      );
    },
  );
  test('4000000000000002 is accepted here (declined only at checkout)', () {
    final r =
        checkCard('4000000000000002', 12, 2030, '123', now: now) as CardValid;
    expect(r.brand, CardBrand.visa);
    expect(r.last4, '0002');
  });
  test('a card that expired last month is rejected', () {
    final r = checkCard('4242424242424242', 10, 2026, '123', now: now);
    expect((r as CardInvalid).field, CardField.expiry);
  });
  test('a card is valid through the end of its expiry month', () {
    expect(
      checkCard('4242424242424242', 11, 2026, '123', now: now),
      isA<CardValid>(),
    );
  });
  test('two-digit years mean 2000 plus the year', () {
    expect(
      (checkCard(
        '4242424242424242',
        1,
        26,
        '123',
        now: now,
      ) as CardInvalid).field,
      CardField.expiry,
    );
    expect(
      checkCard('4242424242424242', 12, 26, '123', now: now),
      isA<CardValid>(),
    );
  });
  test('expiry month must be 1 to 12', () {
    expect(
      (checkCard(
        '4242424242424242',
        13,
        2030,
        '123',
        now: now,
      ) as CardInvalid).field,
      CardField.expiry,
    );
    expect(
      (checkCard(
        '4242424242424242',
        0,
        2030,
        '123',
        now: now,
      ) as CardInvalid).field,
      CardField.expiry,
    );
  });
  test('CVV must be 3 or 4 digits', () {
    for (final bad in ['12', '12345', '12a', '']) {
      expect(
        (checkCard(
          '4242424242424242',
          12,
          2030,
          bad,
          now: now,
        ) as CardInvalid).field,
        CardField.cvv,
        reason: bad,
      );
    }
    for (final good in ['123', '1234']) {
      expect(
        checkCard('4242424242424242', 12, 2030, good, now: now),
        isA<CardValid>(),
        reason: good,
      );
    }
  });
  test('number is checked before expiry and CVV', () {
    expect(
      (checkCard(
        '4242424242424241',
        1,
        2020,
        '1',
        now: now,
      ) as CardInvalid).field,
      CardField.number,
    );
  });
  test('CardValid and CardInvalid compare by value', () {
    expect(
      CardValid(brand: CardBrand.visa, last4: '4242'),
      CardValid(brand: CardBrand.visa, last4: '4242'),
    );
    expect(
      CardValid(brand: CardBrand.visa, last4: '4242').hashCode,
      CardValid(brand: CardBrand.visa, last4: '4242').hashCode,
    );
    expect(
      CardInvalid(field: CardField.cvv, message: 'x'),
      CardInvalid(field: CardField.cvv, message: 'x'),
    );
    expect(
      CardInvalid(field: CardField.cvv, message: 'x'),
      isNot(CardInvalid(field: CardField.number, message: 'x')),
    );
  });
}
