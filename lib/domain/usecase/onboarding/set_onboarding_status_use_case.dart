import 'package:kickoff/domain/repository/settings_repository.dart';

class SetOnboardingStatusUseCase {
  final SettingsRepository _settingsRepository;

  SetOnboardingStatusUseCase({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;

  Future<void> call(bool status) async {
    await _settingsRepository.setOnboardingStatus(status);
  }
}
