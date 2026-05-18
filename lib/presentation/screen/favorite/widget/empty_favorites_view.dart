import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class EmptyFavoritesView extends StatelessWidget {
  const EmptyFavoritesView({super.key, required this.t});

  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: t.surfaceDeep,
                shape: BoxShape.circle,
                border: Border.all(color: t.border, width: 1.5),
              ),
              child: Icon(
                Icons.favorite_outline_rounded,
                size: 32,
                color: t.textTertiary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No Favorites Yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: t.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Browse through our premium selection of products and save your favorites here!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: t.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(180, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Explore Products'),
            ),
          ],
        ),
      ),
    );
  }
}
