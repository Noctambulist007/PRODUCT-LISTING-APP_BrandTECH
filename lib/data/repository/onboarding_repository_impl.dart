import 'package:productify/domain/repository/onboarding_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final SharedPreferences _sharedPreferences;
  static const String _keyOnboardingStatus = 'onboarding_status';

  OnboardingRepositoryImpl({required SharedPreferences sharedPreferences})
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
