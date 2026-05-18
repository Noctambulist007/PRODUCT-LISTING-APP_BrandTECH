import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/favorite/notifier/provider.dart';
import 'package:productify/presentation/screen/favorite/state/favorite_ui_state.dart';
import 'package:productify/presentation/screen/home/widget/star_rating.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key, required this.product, required this.t});

  final Product product;
  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: t.textPrimary,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                color: t.textSecondary,
                height: 1.4,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                StarRating(rating: product.rating.rate, size: 11),
                const SizedBox(width: 4),
                Text(
                  '(${product.rating.count})',
                  style: TextStyle(
                    fontSize: 10,
                    color: t.textTertiary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: t.textPrimary,
                    letterSpacing: -0.3,
                  ),
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final favState = ref.watch(favoriteNotifierProvider);
                    final isFav =
                        favState is SuccessState &&
                        favState.favorites.any((p) => p.id == product.id);

                    return GestureDetector(
                      onTap: () {
                        ref
                            .read(favoriteNotifierProvider.notifier)
                            .toggleFavorite(product);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: isFav ? t.accentSurface : t.surfaceDeep,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isFav ? t.accentLight : t.border,
                          ),
                        ),
                        child: Icon(
                          isFav
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          size: 14,
                          color: isFav ? t.accent : t.textSecondary,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
