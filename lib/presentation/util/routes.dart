import 'package:flutter/material.dart';
import 'package:productify/presentation/screen/home/home_screen.dart';

class Routes {
  static const String home = 'home';

  static PageRoute generateRoutes(RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (settings.name) {
          case home:
            return const HomeScreen();
          default:
            return const HomeScreen();
        }
      },
    );
  }
}
