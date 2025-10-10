import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/services/di.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/cubit/order_cubit.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/ui/ahwa_manager_app.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/di/di.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/ui/login_screen.dart';

//* Ahwa App
// void main() {
//   setupLocator();
//   runApp(
//     BlocProvider(
//       create: (_) => getIt<OrderCubit>(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: AhwaManagerApp(),
//       ),
//     ),
//   );
// }

//* Ecommerce App
void main() {
  setAllDependencies();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laza App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}
