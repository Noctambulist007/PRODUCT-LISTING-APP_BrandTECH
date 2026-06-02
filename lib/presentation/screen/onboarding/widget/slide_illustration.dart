import 'package:flutter/material.dart';
import 'package:productify/domain/model/onboarding/slide_data.dart';
import 'package:productify/presentation/screen/onboarding/widget/ring.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class SlideIllustration extends StatelessWidget {
  const SlideIllustration({super.key, required this.slide, required this.t});

  final SlideData slide;
  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final glowColor = t.accent.withValues(alpha: isDark ? 0.15 : 0.08);

    return Container(
      width: double.infinity,
      color: t.surfaceWarm,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [glowColor, glowColor.withValues(alpha: 0.0)],
              ),
            ),
          ),
          Ring(size: 260, opacity: 0.15, color: t.border),
          Ring(size: 190, opacity: 0.25, color: t.border),
          Ring(size: 120, opacity: 0.35, color: t.border),
          Positioned(
            top: 28,
            left: 28,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: t.accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: t.accent.withValues(alpha: 0.3)),
              ),
              child: Text(
                slide.tag,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: t.accent,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              color: t.surface.withValues(alpha: 0.9),
              shape: BoxShape.circle,
              border: Border.all(color: t.border, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: t.accent.withValues(alpha: 0.15),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                slide.image,
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.width * 0.50,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
