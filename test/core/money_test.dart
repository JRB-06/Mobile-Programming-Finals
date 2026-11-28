import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/money.dart';

void main() {
  test('formats centavos as pesos with 2 decimals', () {
    expect(Money(5000).format(), '₱50.00');
  });
  test('groups thousands and keeps sub-peso centavos', () {
    expect(Money(123450).format(), '₱1,234.50');
    expect(Money(5).format(), '₱0.05');
    expect(Money(0).format(), '₱0.00');
  });
  test('formats negative amounts with the sign before the peso sign', () {
    expect(Money(-1200).format(), '-₱12.00');
  });
  test('toString returns the formatted amount', () {
    expect(Money(68000).toString(), '₱680.00');
  });
  test('parses a decimal string to centavos', () {
    expect(Money.parse('680.00').centavos, 68000);
  });
  test('parses num values through their string form', () {
    expect(Money.parse(680).centavos, 68000);
    expect(Money.parse(680.0).centavos, 68000);
    expect(Money.parse(680.5).centavos, 68050);
  });
  test('trims surrounding whitespace before parsing', () {
    expect(Money.parse(' 680.00 ').centavos, 68000);
  });
  test('parses a leading minus sign', () {
    expect(Money.parse('-12.5').centavos, -1250);
  });
  test('parse rejects anything but an amount with up to 2 decimals', () {
    for (final bad in [
      '1.234',
      '',
      'abc',
      '₱1.00',
      '1.',
      '.5',
      '1,000.00',
      '1.2.3',
    ]) {
      expect(() => Money.parse(bad), throwsFormatException, reason: bad);
    }
  });
  test('equal centavos are equal with equal hashCode', () {
    expect(Money(100), Money(100));
    expect(Money(100).hashCode, Money(100).hashCode);
    expect(Money(100), isNot(Money(200)));
  });
  test('adds and subtracts in centavos', () {
    expect((Money(100) + Money(250)).centavos, 350);
    expect((Money(500) - Money(120)).centavos, 380);
  });
  test('multiplies by an integer quantity', () {
    expect((Money(1250) * 3).centavos, 3750);
  });
  test('zero is Money(0)', () {
    expect(Money.zero, Money(0));
  });
  test('orders by centavos', () {
    expect(Money(1).compareTo(Money(2)), lessThan(0));
    final sorted = [Money(300), Money(100)]..sort();
    expect(sorted.first, Money(100));
  });
}
