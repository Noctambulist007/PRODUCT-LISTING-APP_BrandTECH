import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.loading() = SplashLoading;

  const factory SplashState.goOnboarding() = SplashGoOnboarding;

  const factory SplashState.goHome() = SplashGoHome;
}