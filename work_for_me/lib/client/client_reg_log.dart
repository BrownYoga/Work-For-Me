import 'package:flutter/material.dart';

class ClientRegLog extends StatelessWidget {
  const ClientRegLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Registration/Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo can go here
            const Icon(
              Icons.business,
              size: 100,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Client Login
              },
              child: const Text('Client Login'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Navigate to Client Registration
              },
              child: const Text('Client Registration'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Work For Me™'),
      ),
    );
  }
}
