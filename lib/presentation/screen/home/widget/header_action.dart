import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class HeaderAction extends StatelessWidget {
  const HeaderAction({
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: t.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: t.border),
        ),
        child: Icon(icon, color: t.textPrimary, size: 20),
      ),
    );
  }
}
