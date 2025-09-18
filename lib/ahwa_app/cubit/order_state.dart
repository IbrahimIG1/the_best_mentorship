import 'package:omar_ahmed_mentor_ship/ahwa_app/models/order.dart';

class OrderStatus {}

class OrderIdle extends OrderStatus {}

class OrderSubmitting extends OrderStatus {}

class OrderError extends OrderStatus {
  final String message;
  OrderError(this.message);
}

class OrderState {
  final List<Order> pending;
  final List<Order> completed;
  final Map<String, int> topSelling;
  final int totalServed;
  final OrderStatus status;

  const OrderState({
    required this.pending,
    required this.completed,
    required this.topSelling,
    required this.totalServed,
    required this.status,
  });

  factory OrderState.initial() => OrderState(
    pending: [],
    completed: [],
    topSelling: {},
    totalServed: 0,
    status: OrderIdle(),
  );

  OrderState copyWith({
    List<Order>? pending,
    List<Order>? completed,
    Map<String, int>? topSelling,
    int? totalServed,
    OrderStatus? status,
  }) {
    return OrderState(
      pending: pending ?? this.pending,
      completed: completed ?? this.completed,
      topSelling: topSelling ?? this.topSelling,
      totalServed: totalServed ?? this.totalServed,
      status: status ?? this.status,
    );
  }
}
