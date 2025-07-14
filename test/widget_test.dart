// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:personal_blog/main.dart';

void main() {
  testWidgets('Learning app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LearningApp());

    // Verify that our app loads with the correct content.
    expect(find.text('DevLearn'), findsWidgets);
    expect(find.text('Master Programming\nWith Expert-Led Courses'), findsOneWidget);

    // Verify navigation and buttons are present
    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Start Learning'), findsOneWidget);
  });
}
