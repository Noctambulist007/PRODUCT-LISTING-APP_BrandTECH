import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/product/widget/circle_action.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';
import 'full_screen_image_viewer.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.product,
    required this.t,
  });

  final Product product;
  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    final tag = 'product-image-${product.id}';
    return Stack(
      children: [
        Container(
          height: 340,
          color: t.surfaceWarm,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    FullScreenImageViewer(imageUrl: product.image, tag: tag),
              ),
            ),
            child: Hero(
              tag: tag,
              child: CachedNetworkImage(
                imageUrl: product.image,
                fit: BoxFit.contain,
                width: double.infinity,
                placeholder: (_, _) => Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: t.border,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  t.background.withValues(alpha: 0.55),
                  t.background.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAction(
                  icon: Icons.arrow_back_ios_new_rounded,
                  t: t,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
