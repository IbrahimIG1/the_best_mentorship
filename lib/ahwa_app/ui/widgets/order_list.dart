import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/cubit/order_cubit.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/cubit/order_state.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state.pending.isEmpty) {
          return const Center(child: Text('No pending orders'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: state.pending.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final o = state.pending[i];
            return Card(
              child: ListTile(
                title: Text('${o.customerName} — ${o.drink.name}'),
                subtitle: Text(o.instructions.isEmpty ? '—' : o.instructions),
                trailing: IconButton(
                  icon: const Icon(Icons.check, color: Colors.green),
                  onPressed: () =>
                      context.read<OrderCubit>().completeOrder(o.id),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
