import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class WorkerDashboard extends StatelessWidget {
  const WorkerDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Worker Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Buttons Here
            ElevatedButton(
              onPressed: () {
                // Implement My Profile functionality
              },
              child: const Text('My Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement View Orders functionality
              },
              child: const Text('View Orders'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement Payments functionality
              },
              child: const Text('Payments'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Logout'),
            ),

            // Your Rating Bar
            Column(
              children: [
                const Text(
                  'Your Rating',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10), // Adjust the space
                RatingBar.builder(
                  initialRating: 4.5,
                  minRating: 1,
                  itemSize: 30,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    logger.i('Rating changed to: $rating'); // Using logger here
                  },
                ),
                const SizedBox(height: 10), // Adjust the space
                const Text(
                  'Rated by 150 workers',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
