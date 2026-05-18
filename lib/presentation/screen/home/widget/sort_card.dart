import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class SortCard extends StatelessWidget {
  const SortCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.t,
    required this.onTap,
    this.isFullWidth = false,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final AppThemeExtension t;
  final VoidCallback onTap;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: isFullWidth ? 18 : 16,
        ),
        decoration: BoxDecoration(
          color: isSelected ? t.accentSurface : t.surfaceDeep,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? t.accentLight : t.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: isSelected ? t.accentLight.withOpacity(0.25) : t.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 20,
                color: isSelected ? t.accentDark : t.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                color: isSelected ? t.accentDark : t.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
