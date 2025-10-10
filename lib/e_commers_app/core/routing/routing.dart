import 'package:flutter/material.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/home_screen/ui/home_screen.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    /* Used When I want pass a value from one screen to another */
    final args = settings.arguments as Map<String, dynamic>?;
    // final userName = args?['userName'] ?? 'Guest';
    // final userId = args?['userId'] ?? 0;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}