import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';
import 'image_error.dart';
import 'image_placeholder.dart';

class CardImage extends StatelessWidget {
  const CardImage({super.key, required this.product, required this.t});

  final Product product;
  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: ColoredBox(
        color: t.surfaceWarm,
        child: Stack(
          children: [
            Hero(
              tag: 'product-image-${product.id}',
              child: CachedNetworkImage(
                imageUrl: product.image,
                fit: BoxFit.contain,
                width: 130,
                height: double.infinity,
                placeholder: (_, __) => ImagePlaceholder(t: t),
                errorWidget: (_, __, ___) => ImageError(t: t),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.55),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: t.accentSurface.withOpacity(0.92),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: t.accentLight.withOpacity(0.5)),
                  ),
                  child: Text(
                    product.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: t.accentDark,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
