import 'package:flutter/material.dart';
import 'package:productify/domain/model/onboarding/slide_data.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class SlideBody extends StatelessWidget {
  const SlideBody({
    super.key,
    required this.slide,
    required this.t,
    required this.index,
    required this.slidesLength,
  });

  final SlideData slide;
  final AppThemeExtension t;
  final int index;
  final int slidesLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: t.accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            slide.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: t.textPrimary,
              height: 1.2,
              letterSpacing: -0.6,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            slide.subtitle,
            style: TextStyle(
              fontSize: 15,
              color: t.textSecondary,
              height: 1.65,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: List.generate(slidesLength, (i) {
              final isActive = i == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(right: 6),
                width: isActive ? 24 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: isActive ? t.accent : t.accent.withOpacity(0.22),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
