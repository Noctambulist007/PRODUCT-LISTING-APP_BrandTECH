import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/presentation/screen/onboarding/notifier/onboarding_notifier.dart';
import 'package:productify/presentation/screen/onboarding/state/onboarding_state.dart';

final onboardingNotifierProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );
