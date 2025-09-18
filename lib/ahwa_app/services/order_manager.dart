// OOP: SRP & DIP — orchestrates order operations, depends on OrderRepository abstraction.
import 'package:omar_ahmed_mentor_ship/ahwa_app/models/drink.dart';

import '../models/order.dart';
import '../repositories/order_repository.dart';

class OrderManager {
  final OrderRepository _repo;

  OrderManager(this._repo);

  OrderRepository get repository => _repo;

  void addOrder(String customerName, Drink drink, String instructions) {
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    final order = Order(
      id: id,
      customerName: customerName,
      drink: drink,
      instructions: instructions,
    );
    _repo.add(order);
  }

  void completeOrder(String id) {
    final orders = _repo.getAll();
    final idx = orders.indexWhere((o) => o.id == id);
    if (idx >= 0) {
      final order = orders[idx];
      order.markCompleted();
      _repo.update(order);
    }
  }

  List<Order> pendingOrders() => _repo.getPending();

  Map<String, int> topSellingByName({int top = 3}) {
    final completed = _repo.getCompleted();
    final Map<String, int> counts = {};
    for (final o in completed) {
      counts[o.drink.name] = (counts[o.drink.name] ?? 0) + 1;
    }
    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return {for (var e in sorted.take(top)) e.key: e.value};
  }

  int totalServed() => _repo.getCompleted().length;
}
