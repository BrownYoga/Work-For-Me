import 'package:flutter/material.dart';
import 'package:work_for_me/spalsh_screen/splashscreen.dart';  // Import the splash screen
import 'package:work_for_me/home_screen/home_screen.dart';  // Import the home screen

void main() {
  runApp(const MyApp());  // Added const here
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);  // Added const and key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SplashScreen(),  // Added const here
        '/home': (context) => const HomeScreen(),  // Added const here
      },
    );
  }
}
