import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/util/toaster.dart';
import 'package:productify/presentation/screen/favorite/notifier/provider.dart';
import 'package:productify/presentation/screen/favorite/state/favorite_ui_state.dart'
    as fav_state;
import 'package:productify/presentation/theme/app_theme_extension.dart';

class AddToCartBar extends ConsumerWidget {
  const AddToCartBar({super.key, required this.product, required this.t});

  final Product product;
  final AppThemeExtension t;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favState = ref.watch(favoriteNotifierProvider);
    final isFav =
        favState is fav_state.SuccessState &&
        favState.favorites.any((p) => p.id == product.id);

    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: t.surface,
        border: Border(top: BorderSide(color: t.border)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              ref
                  .read(favoriteNotifierProvider.notifier)
                  .toggleFavorite(product);
            },
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                border: Border.all(color: isFav ? t.accentLight : t.border),
                borderRadius: BorderRadius.circular(16),
                color: isFav ? t.accentSurface : t.surfaceDeep,
              ),
              child: Icon(
                isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: isFav ? t.accent : t.textSecondary,
                size: 22,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Toaster.showInfo(
                  context,
                  'Add to cart functionality coming soon!',
                );
              },
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  color: t.textPrimary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: t.background,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: t.background,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
