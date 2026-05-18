import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class CircleAction extends StatelessWidget {
  const CircleAction({
    super.key,
    required this.icon,
    required this.t,
    required this.onTap,
  });

  final IconData icon;
  final AppThemeExtension t;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: t.surface.withOpacity(0.92),
          shape: BoxShape.circle,
          border: Border.all(color: t.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(icon, size: 16, color: t.textPrimary),
      ),
    );
  }
}
