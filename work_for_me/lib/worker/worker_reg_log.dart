import 'package:flutter/material.dart';

class WorkerRegLogScreen extends StatelessWidget {
  const WorkerRegLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Worker Area'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo here
            const Icon(
              Icons.work,
              size: 100.0,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to Worker Login
              },
              child: const Text('Worker Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Worker Registration
              },
              child: const Text('Worker Registration'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Work For Me',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('™'),
          ],
        ),
      ),
    );
  }
}
