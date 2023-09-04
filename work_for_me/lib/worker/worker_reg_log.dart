import 'package:flutter/material.dart';

class WorkerRegLog extends StatelessWidget {
  const WorkerRegLog({Key? key}) : super(key: key);

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
            // Logo can go here
            const Icon(
              Icons.business,
              size: 100,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Worker Login
              },
              child: const Text('Worker Login'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Navigate to Worker Registration
              },
              child: const Text('Worker Registration'),
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
