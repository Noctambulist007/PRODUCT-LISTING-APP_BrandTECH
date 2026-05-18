import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class SortChip extends StatelessWidget {
  final AppThemeExtension t;
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const SortChip({
    super.key,
    required this.t,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            color: selected ? t.accentSurface : t.surfaceDeep,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? t.accentLight : t.border,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: selected ? t.accent : t.textSecondary,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: selected ? t.accentDark : t.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}