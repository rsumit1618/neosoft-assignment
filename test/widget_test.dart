import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:assignment_one/main.dart';

void main() {
  testWidgets('Registration screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Registration'), findsOneWidget);
    expect(find.byKey(const Key('first-name')), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
  });
}
