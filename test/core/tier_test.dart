import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/tier.dart';

void main() {
  test('79.9 is Street and 80 is Pharma', () {
    expect(Tier.fromPurity(79.9), Tier.street);
    expect(Tier.fromPurity(80), Tier.pharma);
  });
  test('98.9 is Pharma and 99 is Blue Sky', () {
    expect(Tier.fromPurity(98.9), Tier.pharma);
    expect(Tier.fromPurity(99), Tier.blueSky);
  });
  test('0 and 100 are accepted', () {
    expect(Tier.fromPurity(0), Tier.street);
    expect(Tier.fromPurity(100), Tier.blueSky);
  });
  test('purity outside 0 to 100 is rejected', () {
    expect(() => Tier.fromPurity(-0.1), throwsArgumentError);
    expect(() => Tier.fromPurity(100.1), throwsArgumentError);
    expect(() => Tier.fromPurity(double.nan), throwsArgumentError);
  });
}
