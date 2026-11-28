import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/main.dart';

void main() {
  testWidgets('App shows the title', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Los Pollos Hermanos'), findsOneWidget);
  });
}
