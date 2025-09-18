// OOP: Encapsulation — controls access to order data by use getters and intentful methods.

import 'package:omar_ahmed_mentor_ship/ahwa_app/models/drink.dart';

class Order {
  final String id;
  String _customerName;
  Drink _drink;
  String _instructions;
  bool _completed;
  final DateTime createdAt;

  Order({
    required this.id,
    required String customerName,
    required Drink drink,
    String instructions = '',
  }) : _customerName = customerName,
       _drink = drink,
       _instructions = instructions,
       _completed = false,
       createdAt = DateTime.now();

  String get customerName => _customerName;
  Drink get drink => _drink;
  String get instructions => _instructions;
  bool get completed => _completed;

  void update({String? customerName, Drink? drink, String? instructions}) {
    if (customerName != null && customerName.isNotEmpty) {
      _customerName = customerName;
    }
    if (drink != null) _drink = drink;
    if (instructions != null) _instructions = instructions;
  }

  void markCompleted() => _completed = true;
}
