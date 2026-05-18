import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.t,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final AppThemeExtension t;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? t.textPrimary : t.surface,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: isSelected ? t.textPrimary : t.border),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? t.background : t.textSecondary,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}
