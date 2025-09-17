import 'package:flutter/material.dart';

class Screen {
  void navigate() {
    print('Navigating to screen');
  }
}

class HomeScreen extends Screen {
  @override
  void navigate() {
    print('Navigating to home');
  }
}

class SettingsScreen  {

  //* the solution is not extends from screen because SettingsScreen navigate with different way so it's wrong to be subclass from Screen class
  void navigate() {
    throw Exception('Settings don\'t navigate this way!');
  }
}

class NavigationButton extends StatelessWidget {
  final Screen screen;
  NavigationButton(this.screen);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => screen.navigate(),
      child: Text('Navigate'),
    );
  }
}
