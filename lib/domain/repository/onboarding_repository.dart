abstract class OnboardingRepository {
  Future<bool> getOnboardingStatus();

  Future<void> setOnboardingStatus(bool status);
}
