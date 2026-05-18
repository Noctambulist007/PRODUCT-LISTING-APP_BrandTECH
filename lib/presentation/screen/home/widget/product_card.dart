import 'package:flutter/material.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/home/widget/card_image.dart';
import 'package:productify/presentation/screen/home/widget/card_info.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.index = 0,
  });

  final Product product;
  final VoidCallback onTap;
  final int index;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pressCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 120),
    lowerBound: 0,
    upperBound: 1,
  );

  late final Animation<double> _scale = Tween<double>(
    begin: 1.0,
    end: 0.97,
  ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut));

  @override
  void dispose() {
    _pressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;
    final imageOnRight = widget.index.isOdd;

    return GestureDetector(
      onTapDown: (_) => _pressCtrl.forward(),
      onTapUp: (_) async {
        await _pressCtrl.reverse();
        widget.onTap();
      },
      onTapCancel: () => _pressCtrl.reverse(),
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: t.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: t.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Row(
            children: imageOnRight
                ? [
                    CardInfo(product: widget.product, t: t),
                    CardImage(product: widget.product, t: t),
                  ]
                : [
                    CardImage(product: widget.product, t: t),
                    CardInfo(product: widget.product, t: t),
                  ],
          ),
        ),
      ),
    );
  }
}
