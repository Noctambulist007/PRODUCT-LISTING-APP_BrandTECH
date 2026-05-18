import 'package:flutter/material.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/home/widget/animated_card.dart';
import 'package:productify/presentation/screen/home/widget/end_caption.dart';
import 'package:productify/presentation/screen/home/widget/load_more_indicator.dart';
import 'package:productify/presentation/screen/home/widget/product_card.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.products,
    required this.hasMore,
    required this.isLoadingMore,
    required this.onProductTap,
  });

  final List<Product> products;
  final bool hasMore;
  final bool isLoadingMore;
  final ValueChanged<Product> onProductTap;

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;
    final itemCount = products.length + (hasMore || isLoadingMore ? 1 : 0);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          if (index == products.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
              child: isLoadingMore ? LoadMoreIndicator(t: t) : EndCaption(t: t),
              );
            }

          final delay = Duration(milliseconds: (index * 50).clamp(0, 400));
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AnimatedCard(
              delay: delay,
              child: ProductCard(
                product: products[index],
                index: index,
                onTap: () => onProductTap(products[index]),
              ),
            ),
          );
        }, childCount: itemCount),
      ),
    );
  }
}
