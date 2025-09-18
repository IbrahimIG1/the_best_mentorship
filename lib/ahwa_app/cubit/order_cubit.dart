// OOP: Separation of concerns — Cubit encapsulates UI state transitions for orders.
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/cubit/order_state.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/helpers/drink_factory.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/services/order_manager.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderManager _manager;
  OrderCubit(this._manager) : super(OrderState.initial()) {
    refresh();
  }

  void refresh() {
    emit(
      state.copyWith(
        pending: _manager.pendingOrders(),
        completed: _manager.repository.getCompleted(),
        topSelling: _manager.topSellingByName(),
        totalServed: _manager.totalServed(),
        status: OrderIdle(),
      ),
    );
  }

  void addOrder({
    required String customer,
    required String drinkName,
    required String instructions,
  }) {
    try {
      emit(state.copyWith(status: OrderSubmitting()));
      final drink = DrinkFactory.create(drinkName);
      _manager.addOrder(customer, drink, instructions);
      refresh();
    } catch (e) {
      emit(state.copyWith(status: OrderError(e.toString())));
    }
  }

  void completeOrder(String id) {
    _manager.completeOrder(id);
    refresh();
  }

  void clearAll() {
    _manager.repository.clearAll();
    refresh();
  }
}
