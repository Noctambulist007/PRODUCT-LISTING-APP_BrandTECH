import 'package:flutter/material.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/favorite/favorite_screen.dart';
import 'package:productify/presentation/screen/home/home_screen.dart';
import 'package:productify/presentation/screen/onboarding/onboarding_screen.dart';
import 'package:productify/presentation/screen/product/product_detail_screen.dart';
import 'package:productify/presentation/screen/splash/splash_screen.dart';

abstract class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const detail = '/detail';
  static const favorite = '/favorite';
}

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _fadeSlide(const SplashScreen());

      case AppRoutes.onboarding:
        return _fadeSlide(const OnboardingScreen());

      case AppRoutes.home:
        return _fadeSlide(const HomeScreen());

      case AppRoutes.favorite:
        return _fadeSlide(const FavoriteScreen());

      case AppRoutes.detail:
        final product = settings.arguments as Product;
        return _sharedAxisX(ProductDetailScreen(product: product));

      default:
        return _fadeSlide(const HomeScreen());
    }
  }
}

PageRoute<T> _fadeSlide<T>(Widget page) {
  return PageRouteBuilder<T>(
    pageBuilder: (_, animation, __) => page,
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (_, animation, __, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.04),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
  );
}

PageRoute<T> _sharedAxisX<T>(Widget page) {
  return PageRouteBuilder<T>(
    pageBuilder: (_, animation, __) => page,
    transitionDuration: const Duration(milliseconds: 420),
    reverseTransitionDuration: const Duration(milliseconds: 360),
    transitionsBuilder: (_, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutQuart,
        reverseCurve: Curves.easeInQuart,
      );
      final secondaryCurved = CurvedAnimation(
        parent: secondaryAnimation,
        curve: Curves.easeOutQuart,
      );
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(curved),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-0.25, 0),
          ).animate(secondaryCurved),
          child: FadeTransition(opacity: curved, child: child),
        ),
      );
    },
  );
}
