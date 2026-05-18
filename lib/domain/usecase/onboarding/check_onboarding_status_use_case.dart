import 'package:productify/domain/repository/onboarding_repository.dart';

class CheckOnboardingStatusUseCase {
  final OnboardingRepository _onboardingRepository;

  CheckOnboardingStatusUseCase({
    required OnboardingRepository onboardingRepository,
  }) : _onboardingRepository = onboardingRepository;

  Future<bool> call() async {
    return await _onboardingRepository.getOnboardingStatus();
  }
}
