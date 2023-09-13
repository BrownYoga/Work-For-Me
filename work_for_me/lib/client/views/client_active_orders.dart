import 'package:flutter/material.dart';

class ClientActiveOrders extends StatelessWidget {
  const ClientActiveOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildOrderTile('Paul', 'Painter'),
                  _buildOrderTile('John', 'Builder'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to dashboard
              },
              child: const Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTile(String workerName, String workType) {
    return GestureDetector(
      onTap: () {
        // Do something
      },
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.work),
          title: Text(workerName),
          subtitle: Text(workType),
        ),
      ),
    );
  }
}
