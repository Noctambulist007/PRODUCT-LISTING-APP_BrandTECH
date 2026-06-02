import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class ClearFavoritesDialog extends StatelessWidget {
  final AppThemeExtension t;
  final VoidCallback onClear;

  const ClearFavoritesDialog({
    super.key,
    required this.t,
    required this.onClear,
  });

  static Future<void> show(
    BuildContext context, {
    required AppThemeExtension t,
    required VoidCallback onClear,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'dismiss',
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, _, _) => const SizedBox.shrink(),
      transitionBuilder: (ctx, anim, _, _) {
        final curved = CurvedAnimation(parent: anim, curve: Curves.easeOutBack);

        return ScaleTransition(
          scale: curved,
          child: ClearFavoritesDialog(t: t, onClear: onClear),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: t.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: t.border),
      ),
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: t.errorColor, size: 28),
          const SizedBox(width: 10),
          Text(
            'Clear Favorites',
            style: TextStyle(color: t.textPrimary, fontWeight: FontWeight.w800),
          ),
        ],
      ),
      content: Text(
        'Are you sure you want to clear all favorited products? This action cannot be undone.',
        style: TextStyle(color: t.textSecondary, height: 1.4),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: t.textTertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            onClear();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: t.errorColor,
            foregroundColor: Colors.white,
            minimumSize: const Size(100, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Clear All'),
        ),
      ],
    );
  }
}
