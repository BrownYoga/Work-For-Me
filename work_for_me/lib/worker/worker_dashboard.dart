import 'package:flutter/material.dart';

class WorkerDashboard extends StatelessWidget {
  const WorkerDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Worker Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Star Rating Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_border),
                Icon(Icons.star_border),
              ],
            ),
            const SizedBox(height: 32),
            // Buttons Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement logic here
                  },
                  child: const Text('Logout'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Implement logic here
                  },
                  child: const Text('My Profile'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Implement logic here
                  },
                  child: const Text('View Orders'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Implement logic here
                  },
                  child: const Text('Payments'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
