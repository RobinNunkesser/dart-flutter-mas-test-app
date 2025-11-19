// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mas_test_app/main.dart';
import 'package:mas_test_app/result.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Start test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => Result(),
        child: const MyApp(),
      ),
    );

    expect(find.widgetWithText(ElevatedButton, 'Start'), findsOneWidget);

    // Tap the Start button and trigger a frame.
    await tester.tap(find.widgetWithText(ElevatedButton, 'Start'));
    await tester.pump();
  });
}
