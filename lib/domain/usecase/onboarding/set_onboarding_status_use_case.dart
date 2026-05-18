import 'package:productify/domain/repository/onboarding_repository.dart';

class SetOnboardingStatusUseCase {
  final OnboardingRepository _onboardingRepository;

  SetOnboardingStatusUseCase({
    required OnboardingRepository onboardingRepository,
  }) : _onboardingRepository = onboardingRepository;

  Future<void> call(bool status) async {
    await _onboardingRepository.setOnboardingStatus(status);
  }
}
