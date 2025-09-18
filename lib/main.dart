import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/services/di.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/cubit/order_cubit.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/ui/ahwa_manager_app.dart';

void main() {
  setupLocator();
  runApp(
    BlocProvider(
      create: (_) => getIt<OrderCubit>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AhwaManagerApp(),
      ),
    ),
  );
}
