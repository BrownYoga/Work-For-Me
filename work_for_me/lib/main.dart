import 'package:flutter/material.dart';
import 'package:work_for_me/spalsh_screen/splashscreen.dart'; // Import the splash screen
import 'package:work_for_me/home_screen/home_screen.dart';  // Import the home screen
import 'package:work_for_me/worker/worker_reg_log.dart';  // Import the worker registration and login screen
import 'package:work_for_me/client/client_reg_log.dart';  // Import the client registration and login screen
import 'package:work_for_me/client/client_login.dart';  // Import for ClientLogin
import 'package:work_for_me/worker/worker_login.dart';
import 'client/client_registration.dart';  

void main() {
  runApp(const MyApp());  // Added const here
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);  // Added const and key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),  // Added const here
        '/home': (context) => const HomeScreen(),  // Added const here
        '/worker_reg_log': (context) => const WorkerRegLog(), // Worker Registration and Login
        '/client_reg_log': (context) => const ClientRegLog(), // Client Registration and Login
        '/client_login': (context) => const ClientLogin(),  // New route for ClientLogin
        '/worker_login': (context) => const WorkerLogin(),
        '/client_registration': (context) => const ClientRegistration(),
      },
    );
  }
}
