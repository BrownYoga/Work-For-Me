import 'package:flutter/material.dart';
import 'package:work_for_me/spalsh_screen/splashscreen.dart'; // Import the splash screen
import 'package:work_for_me/home_screen/home_screen.dart'; // Import the home screen
import 'package:work_for_me/worker/worker_reg_log.dart'; // Import the worker registration and login screen
import 'package:work_for_me/client/client_reg_log.dart'; // Import the client registration and login screen
import 'package:work_for_me/client/client_login.dart'; // Import for ClientLogin
import 'package:work_for_me/worker/worker_login.dart';
import 'package:work_for_me/worker/worker_registration.dart';
import 'client/client_registration.dart';
import 'package:work_for_me/client/views/client_dashboard.dart';
import 'package:work_for_me/client/client_profile.dart';
import 'package:work_for_me/client/client_find_a_worker.dart';
import 'package:work_for_me/worker/views/worker_dashboard.dart';
import 'package:work_for_me/client/client_active_orders.dart';

void main() {
  runApp(const MyApp()); // Added const here
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Added const and key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(), // Added const here
        '/home': (context) => const HomeScreen(), // Added const here
        '/worker_reg_log': (context) => const WorkerRegLog(), // Worker Registration and Login
        '/client_reg_log': (context) => const ClientRegLog(), // Client Registration and Login
        '/client_login': (context) => const ClientLogin(), // New route for ClientLogin
        '/worker_login': (context) => const WorkerLogin(),
        '/client_registration': (context) => const ClientRegistration(),
        '/worker_registration': (context) => const WorkerRegistration(),
        '/client_dashboard': (context) => const ClientDashboard(),
        '/worker_dashboard': (context) => const WorkerDashboard(),
        '/client_profile': (context) => const ClientProfile(),
        '/client_find_a_worker': (context) => const ClientFindAWorker(),
        '/client_active_orders': (context) => const ClientActiveOrders(),
      },
    );
  }
}
