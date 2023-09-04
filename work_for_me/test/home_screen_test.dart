import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:work_for_me/home_screen/home_screen.dart';

void main() {
  group('Home Screen Tests', () {
    testWidgets('Navigates to WorkerRegLog when "I am a worker" is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HomeScreen(),
          routes: {
            '/worker_reg_log': (context) =>
                const Text('Mock WorkerRegLog screen'),
          },
        ),
      );

      await tester.tap(find.text('I am a worker'));
      await tester.pumpAndSettle();

      expect(find.text('Mock WorkerRegLog screen'), findsOneWidget);
    });

    testWidgets('Navigates to ClientRegLog when "I am a client" is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HomeScreen(),
          routes: {
            '/client_reg_log': (context) =>
                const Text('Mock ClientRegLog screen'),
          },
        ),
      );

      await tester.tap(find.text('I am a client'));
      await tester.pumpAndSettle();

      expect(find.text('Mock ClientRegLog screen'), findsOneWidget);
    });
  });
}
