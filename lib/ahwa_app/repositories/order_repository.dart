// OOP: Interface Segregation & DIP — repository abstraction decouples data source from business logic.
import '../models/order.dart';

abstract class OrderRepository {
  void add(Order order);
  void update(Order order);
  List<Order> getAll();
  List<Order> getPending();
  List<Order> getCompleted();
  void clearAll();
}
