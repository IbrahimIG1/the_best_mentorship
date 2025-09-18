// OOP: SRP — concrete repository handling only in-memory persistence; replaceable via OrderRepository.
import '../models/order.dart';
import 'order_repository.dart';

class InMemoryOrderRepository implements OrderRepository {
  final List<Order> _orders = [];

  @override
  void add(Order order) {
    return _orders.add(order);
  }

  @override
  void update(Order order) {
    final idx = _orders.indexWhere((o) => o.id == order.id);
    if (idx >= 0) _orders[idx] = order;
  }

  @override
  List<Order> getAll() {
    return List.unmodifiable(_orders);
  }

  @override
  List<Order> getPending() {
    return List.unmodifiable(_orders.where((o) => !o.completed));
  }

  @override
  List<Order> getCompleted() {
    return List.unmodifiable(_orders.where((o) => o.completed));
  }

  @override
  void clearAll() {
    return _orders.clear();
  }
}
