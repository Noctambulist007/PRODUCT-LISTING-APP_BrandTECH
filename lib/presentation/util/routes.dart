import 'package:flutter/material.dart';
import 'package:productify/presentation/screen/main/main_screen.dart';

class Routes {
  static const String splash = 'splash';
  static const String onboarding = 'onboarding';
  static const String main = 'main';
  static const String home = 'home';

  static PageRoute generateRoutes(RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (settings.name) {
          case main:
            return const MainScreen();
          default:
            return const MainScreen();
        }
      },
    );
  }
}
