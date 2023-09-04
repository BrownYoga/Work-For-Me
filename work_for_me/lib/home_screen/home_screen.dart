import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to WFM'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Placeholder for a logo
          const Expanded(
            flex: 2,
            child: Center(
              child: Icon(
                Icons.account_circle,
                size: 100.0,
              ),
            ),
          ),
          // Two buttons in the middle
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/worker_reg_log');
                  },
                  child: const Text('I am a Worker'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/client_reg_log');
                  },
                  child: const Text('I am a Client'),
                ),
              ],
            ),
          ),
          // Footer
          const Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Work For Me™',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
