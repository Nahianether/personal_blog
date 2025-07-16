// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:personal_blog/main.dart';

void main() {
  testWidgets('Learning app creates widget successfully', (WidgetTester tester) async {
    // Test that the LearningApp widget can be created without errors
    const app = LearningApp();
    expect(app, isA<Widget>());
    
    // Test that the app can be built (this may show overflow warnings but should not crash)
    await tester.pumpWidget(app);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
