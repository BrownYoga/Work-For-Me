import 'package:flutter/material.dart';
import 'package:work_for_me/spalsh_screen/splashscreen.dart';  // Import the splash screen

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);  // Added const and key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Welcome to WFM!'),
      ),
    );
  }
}
