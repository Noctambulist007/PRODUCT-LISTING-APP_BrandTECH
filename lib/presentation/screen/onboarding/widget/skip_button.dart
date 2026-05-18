import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onPressed, required this.t});

  final VoidCallback onPressed;
  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 52, right: 20),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: t.surface.withOpacity(0.85),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: t.border),
          ),
          child: Text(
            'Skip',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: t.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
