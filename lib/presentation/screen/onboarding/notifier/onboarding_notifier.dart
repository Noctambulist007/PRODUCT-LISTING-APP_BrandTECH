import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/usecase/onboarding/set_onboarding_status_use_case.dart';
import 'package:productify/injection_container.dart';
import 'package:productify/presentation/screen/onboarding/state/onboarding_state.dart';

class OnboardingNotifier extends Notifier<OnboardingState> {
  @override
  OnboardingState build() => const OnboardingState();

  void onPageChanged(int page) {
    state = state.copyWith(currentPage: page);
  }

  Future<void> complete() async {
    if (state.isCompleting) return;
    state = state.copyWith(isCompleting: true);
    final useCase = getIt<SetOnboardingStatusUseCase>();
    await useCase(true);
    state = state.copyWith(isDone: true);
  }

  void skip() => complete();
}
