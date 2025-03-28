import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskbloc/main.dart';

void main() {
  testWidgets('Counter increments when the button is tapped', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget( MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' button and trigger a rebuild.
    await tester.tap(find.byKey(const Key('increment_button')));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
