import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/presentation/screen/splash/notifier/splash_notifier.dart';
import 'package:productify/presentation/screen/splash/state/splash_state.dart';

final splashNotifierProvider = NotifierProvider<SplashNotifier, SplashState>(
  SplashNotifier.new,
);
