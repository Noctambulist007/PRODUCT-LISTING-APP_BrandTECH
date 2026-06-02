import 'package:productify/domain/repository/onboarding_repository.dart';

class FakeOnboardingRepository implements OnboardingRepository {
  bool? savedStatus;

  @override
  Future<bool> getOnboardingStatus() async {
    return savedStatus ?? false;
  }

  @override
  Future<void> setOnboardingStatus(bool status) async {
    savedStatus = status;
  }
}
