import 'package:flutter/material.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/home/widget/star_rating.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class PriceRatingRow extends StatelessWidget {
  const PriceRatingRow({super.key, required this.product, required this.t});

  final Product product;
  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'PRICE',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      color: t.textTertiary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: t.textPrimary,
                      letterSpacing: -0.8,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(width: 32, thickness: 1.5, color: t.border),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'RATING',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      color: t.accentDark,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  StarRating(
                    rating: product.rating.rate,
                    size: 14,
                    showNumber: true,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${product.rating.count} reviews',
                    style: TextStyle(
                      fontSize: 9,
                      color: t.accentDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
