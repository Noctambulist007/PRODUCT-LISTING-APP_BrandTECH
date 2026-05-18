import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/flutter_carousel_intro.dart';
import 'package:flutter_carousel_intro/slider_item_model.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/util/routes.dart';
import 'package:productify/domain/util/slides.dart';
import 'package:productify/presentation/screen/onboarding/notifier/provider.dart';
import 'package:productify/presentation/screen/onboarding/widget/nav_label.dart';
import 'package:productify/presentation/screen/onboarding/widget/next_button.dart';
import 'package:productify/presentation/screen/onboarding/widget/skip_button.dart';
import 'package:productify/presentation/screen/onboarding/widget/slide_body.dart';
import 'package:productify/presentation/screen/onboarding/widget/slide_illustration.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.appTheme;
    final notifier = ref.read(onboardingNotifierProvider.notifier);

    ref.listen(onboardingNotifierProvider, (_, next) {
      if (next.isDone) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    });

    return Scaffold(
      backgroundColor: t.background,
      body: FlutterCarouselIntro(
        scrollDirection: Axis.vertical,
        animatedRotateX: true,
        animatedRotateZ: false,
        animatedOpacity: true,
        scale: false,
        autoPlay: false,
        showIndicators: true,
        indicatorAlign: IndicatorAlign.right,
        primaryColor: t.accent,
        secondaryColor: t.border,
        showNextButton: true,
        onSkip: notifier.skip,
        onDone: notifier.complete,
        skipLabel: NavLabel(label: 'Skip', color: t.textTertiary),
        nextLabel: NavLabel(label: 'Next', color: t.textPrimary),
        doneLabel: NavLabel(label: "Let's go", color: t.textPrimary),
        nextButtonBuilder: (ctx, onPressed) => NextButton(
          label: 'Next',
          color: t.accent,
          onPressed: onPressed,
          isLast: false,
        ),
        doneButtonBuilder: (ctx, onPressed) => NextButton(
          label: "Let's go →",
          color: t.accent,
          onPressed: () async {
            await notifier.complete();
          },
          isLast: true,
        ),
        skipButtonBuilder: (ctx, onPressed) =>
            SkipButton(onPressed: onPressed, t: t),
        slides: List.generate(slides.length, (i) {
          final slide = slides[i];
          return SliderItem(
            title: '',
            subtitle: SlideBody(
              slide: slide,
              t: t,
              index: i,
              slidesLength: slides.length,
            ),
            widget: SlideIllustration(slide: slide, t: t),
          );
        }),
      ),
    );
  }
}
