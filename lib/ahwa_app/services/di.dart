// OOP: Dependency Injection (DIP) — get_it centralizes instance wiring and lifecycles.
import 'package:get_it/get_it.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/repositories/in_memory_order_repository.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/repositories/order_repository.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/cubit/order_cubit.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/services/order_manager.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  if (getIt.isRegistered<OrderRepository>()) return;

  getIt.registerLazySingleton<OrderRepository>(() => InMemoryOrderRepository());
  getIt.registerLazySingleton<OrderManager>(
    () => OrderManager(getIt<OrderRepository>()),
  );
  getIt.registerLazySingleton<OrderCubit>(
    () => OrderCubit(getIt<OrderManager>()),
  );
}
