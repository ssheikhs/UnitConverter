import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_converter/main.dart';

void main() {
  testWidgets('10 Kilometer converts to 10000 Meter in real time',
      (tester) async {
    await tester.pumpWidget(const UnitConverterApp());

    // Default is Meter -> Kilometer; swap to Kilometer -> Meter.
    await tester.tap(find.byKey(const Key('swap_button')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('value_input')), '10');
    await tester.pump();

    expect(find.text('10 Kilometer = 10000 Meter'), findsOneWidget);
  });
}
