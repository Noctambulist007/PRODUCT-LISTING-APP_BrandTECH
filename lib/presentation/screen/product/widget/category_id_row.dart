import 'package:flutter/material.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class CategoryIdRow extends StatelessWidget {
  const CategoryIdRow({super.key, required this.product, required this.t});

  final Product product;
  final AppThemeExtension t;

  String get _formattedCat => product.category
      .split(' ')
      .map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1)}' : w)
      .join(' ');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: t.accentSurface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: t.accentLight.withOpacity(0.5)),
          ),
          child: Text(
            _formattedCat,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: t.accentDark,
              letterSpacing: 0.3,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: t.surfaceDeep,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: t.border),
          ),
          child: Text(
            '#${product.id}',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: t.textTertiary,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ],
    );
  }
}
