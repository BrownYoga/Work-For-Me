import 'package:flutter/material.dart';

class ClientProfile extends StatelessWidget {
  const ClientProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: 'Current Username',  // Replace with actual value
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              initialValue: 'current.email@example.com',  // Replace with actual value
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              initialValue: '123-456-7890',  // Replace with actual value
              decoration: const InputDecoration(labelText: 'Contact Number'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Update Profile logic here
              },
              child: const Text('Update Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);  // Navigate back to dashboard
              },
              child: const Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
