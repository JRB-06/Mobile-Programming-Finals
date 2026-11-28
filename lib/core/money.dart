final class Money implements Comparable<Money> {
  const Money(this.centavos);

  final int centavos;

  String format() {
    final abs = centavos.abs();
    final pesos = (abs ~/ 100).toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (m) => ',',
    );
    final cents = (abs % 100).toString().padLeft(2, '0');
    final sign = centavos < 0 ? '-' : '';
    return '$sign₱$pesos.$cents';
  }

  @override
  String toString() => format();

  static final _amount = RegExp(r'^(-?)(\d+)(?:\.(\d{1,2}))?$');

  factory Money.parse(Object value) {
    final match = _amount.firstMatch('$value'.trim());
    if (match == null) throw FormatException('Not a money amount', value);
    final centavos = int.parse(
      match.group(2)! + (match.group(3) ?? '').padRight(2, '0'),
    );
    return Money(match.group(1) == '-' ? -centavos : centavos);
  }

  @override
  bool operator ==(Object other) =>
      other is Money && other.centavos == centavos;

  @override
  int get hashCode => centavos.hashCode;

  Money operator +(Money other) => Money(centavos + other.centavos);

  Money operator -(Money other) => Money(centavos - other.centavos);

  Money operator *(int qty) => Money(centavos * qty);

  static const zero = Money(0);

  @override
  int compareTo(Money other) => centavos.compareTo(other.centavos);
}
