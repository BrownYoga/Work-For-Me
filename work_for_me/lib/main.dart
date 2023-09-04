import 'package:flutter/material.dart';
import 'package:work_for_me/splash_screen/splashscreen.dart';  // Import the splash screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),  // HomeScreen needs to be defined
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to WFM!'),
      ),
    );
  }
}
