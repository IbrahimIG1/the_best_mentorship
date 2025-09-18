import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/cubit/order_cubit.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/cubit/order_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(12),
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.local_cafe),
                title: const Text('Total served'),
                trailing: Text('${state.totalServed}'),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Top-selling drinks',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    if (state.topSelling.isEmpty)
                      const Text('No sales yet')
                    else
                      ...state.topSelling.entries.map(
                        (e) => ListTile(
                          dense: true,
                          title: Text(e.key),
                          trailing: Text('${e.value}'),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            ExpansionTile(
              title: const Text('All Orders (debug)'),
              children: [
                ...[...state.pending, ...state.completed].map(
                  (o) => ListTile(
                    dense: true,
                    title: Text(
                      '${o.customerName} — ${o.drink.name}${o.completed ? " (served)" : ""}',
                    ),
                    subtitle: Text(o.instructions),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
