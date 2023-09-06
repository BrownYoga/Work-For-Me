import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ClientDashboard extends StatelessWidget {
  const ClientDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Your Buttons Here
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: const Text('Logout'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement active orders functionality
            },
            child: const Text('Active Orders'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement find a worker functionality
            },
            child: const Text('Find a Worker'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement view outstanding payments functionality
            },
            child: const Text('View Outstanding Payments'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement profile functionality
            },
            child: const Text('Profile'),
          ),

          // Your Rating Bar
          const Text(
            'Your Rating',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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
              print(rating);
            },
          ),
          const Text(
            'Rated by 150 workers',
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
