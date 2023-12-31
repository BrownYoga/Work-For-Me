import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:work_for_me/client/viewmodels/client_dashboard_viewmodel.dart'; // Make sure to import your ViewModel

var logger = Logger();

class ClientDashboard extends StatelessWidget {
  const ClientDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClientDashboardViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Client Dashboard'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Reordered Buttons Here
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/client_profile');
                },
                child: const Text('Profile'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/client_find_a_worker');
                },
                child: const Text('Find a Worker'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/client_active_orders');
                },
                child: const Text('Active Orders'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement view outstanding payments functionality
                },
                child: const Text('View Outstanding Payments'),
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
                    initialRating: 3.5,
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
      ),
    );
  }
}
