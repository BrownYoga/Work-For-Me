import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ClientDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Your Buttons Here
          ElevatedButton(
            onPressed: () {
              // TODO: Implement logout functionality
              Navigator.pushNamed(context, '/home');
            },
            child: Text('Logout'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement active orders functionality
            },
            child: Text('Active Orders'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement find a worker functionality
            },
            child: Text('Find a Worker'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement view outstanding payments functionality
            },
            child: Text('View Outstanding Payments'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement profile functionality
            },
            child: Text('Profile'),
          ),

          // Your Rating Bar
          Text(
            'Your Rating',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          RatingBar.builder(
            initialRating: 3.5,
            minRating: 1,
            itemSize: 30,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Text(
            'Rated by 150 workers',
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
