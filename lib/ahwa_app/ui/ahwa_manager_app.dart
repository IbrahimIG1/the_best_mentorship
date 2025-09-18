import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/helpers/drink_factory.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/cubit/order_cubit.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/ui/widgets/add_order_form.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/ui/widgets/dashboard.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/ui/widgets/order_list.dart';

class AhwaManagerApp extends StatefulWidget {
  const AhwaManagerApp({super.key});

  @override
  State<AhwaManagerApp> createState() => _AhwaManagerAppState();
}

class _AhwaManagerAppState extends State<AhwaManagerApp> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<OrderCubit>();
    // Seed sample data once for demo
    if (cubit.state.pending.isEmpty && cubit.state.completed.isEmpty) {
      cubit.addOrder(
        customer: 'Ali',
        drinkName: DrinkFactory.availableNames().first,
        instructions: 'no sugar',
      );
      cubit.addOrder(
        customer: 'Hana',
        drinkName: 'Hibiscus Tea',
        instructions: 'extra mint',
      );
      cubit.addOrder(
        customer: 'Omar',
        drinkName: 'Turkish Coffee',
        instructions: 'ya rais',
      );
      final first = cubit.state.pending.firstOrNull;
      if (first != null) cubit.completeOrder(first.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [const OrdersPage(), const DashboardPage()];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Ahwa Manager'),
        centerTitle: true,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            selectedIcon: Icon(Icons.list_alt),
            label: 'Orders',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights),
            label: 'Dashboard',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0 ? const AddOrderFab() : null,
    );
  }
}
