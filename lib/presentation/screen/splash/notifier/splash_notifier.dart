import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/usecase/onboarding/check_onboarding_status_use_case.dart';
import 'package:productify/injection_container.dart';
import 'package:productify/presentation/screen/splash/state/splash_state.dart';

class SplashNotifier extends Notifier<SplashState> {
  @override
  SplashState build() {
    _check();
    return const SplashLoading();
  }

  Future<void> _check() async {
    final results = await Future.wait([
      getIt<CheckOnboardingStatusUseCase>().call(),
      Future.delayed(const Duration(milliseconds: 1200)),
    ]);

    final hasSeenOnboarding = results[0] as bool;
    state = hasSeenOnboarding
        ? const SplashGoHome()
        : const SplashGoOnboarding();
  }
}
