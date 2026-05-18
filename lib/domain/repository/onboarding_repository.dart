abstract class SettingsRepository {
  Future<bool> getOnboardingStatus();
  Future<void> setOnboardingStatus(bool status);
}
