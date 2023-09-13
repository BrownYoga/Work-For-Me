import 'package:flutter/material.dart';

class ClientDashboardViewModel extends ChangeNotifier {
  // Example: Your business logic goes here.
  // Let's say you want to display a list of orders for the client.

  List<String> _orders = [];

  List<String> get orders => _orders;

  void fetchOrders() {
    // This is just a dummy example. Normally, you'd fetch data from an API or database.
    _orders = ['Order 1', 'Order 2', 'Order 3'];
    notifyListeners();  // Notify the UI to rebuild and reflect the changes.
  }
}
