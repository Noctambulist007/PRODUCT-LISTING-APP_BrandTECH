import 'package:productify/domain/repository/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SharedPreferences _sharedPreferences;
  static const String _keyOnboardingStatus = 'onboarding_status';

  SettingsRepositoryImpl({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  @override
  Future<bool> getOnboardingStatus() async {
    return _sharedPreferences.getBool(_keyOnboardingStatus) ?? false;
  }

  @override
  Future<void> setOnboardingStatus(bool status) async {
    await _sharedPreferences.setBool(_keyOnboardingStatus, status);
  }
}
