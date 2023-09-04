import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:work_for_me/spalsh_screen/splashscreen.dart';  // Import your splash screen here
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  testWidgets('Splash screen displays WFM and spinner', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: SplashScreen()));

    // Verify if "WFM" is displayed.
    expect(find.text('WFM'), findsOneWidget);

    // Verify if the spinner is displayed.
    expect(find.byType(SpinKitCubeGrid), findsOneWidget);
  });
}
