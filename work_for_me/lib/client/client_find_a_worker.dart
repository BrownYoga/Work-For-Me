// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ClientFindAWorker extends StatefulWidget {
  const ClientFindAWorker({Key? key}) : super(key: key);

  @override
  _ClientFindAWorkerState createState() => _ClientFindAWorkerState();
}

class _ClientFindAWorkerState extends State<ClientFindAWorker> {
  String? dropdownValue;  // Changed from String to String?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Worker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownButton<String?>(
              value: dropdownValue,
              hint: const Text("Filter by Category"),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String?>['Painter', 'Plumber', 'Builder', 'Electrician', null]  // Added null
                  .map<DropdownMenuItem<String?>>((String? value) {
                return DropdownMenuItem<String?>(
                  value: value,
                  child: Text(value ?? "Filter by Category"),  // If value is null, show "Filter by Category"
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  if (dropdownValue == null || dropdownValue == 'Painter') _buildCategoryTile('Painter', Icons.brush),
                  if (dropdownValue == null || dropdownValue == 'Plumber') _buildCategoryTile('Plumber', Icons.build),
                  if (dropdownValue == null || dropdownValue == 'Builder') _buildCategoryTile('Builder', Icons.construction),
                  if (dropdownValue == null || dropdownValue == 'Electrician') _buildCategoryTile('Electrician', Icons.electrical_services),
                ],
              ),
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

  Widget _buildCategoryTile(String title, IconData iconData) {
    return GestureDetector(
      onTap: () {
        // Do something
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 30),  // Reduced the size
            const SizedBox(height: 4),
            Text(title),
          ],
        ),
      ),
    );
  }
}
