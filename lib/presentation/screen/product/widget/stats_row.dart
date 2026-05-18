import 'package:flutter/material.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/product/widget/stat_chip.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key, required this.product, required this.t});

  final Product product;
  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatChip(
            icon: Icons.inventory_2_outlined,
            label: 'In Stock',
            value: 'Available',
            t: t,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatChip(
            icon: Icons.local_shipping_outlined,
            label: 'Shipping',
            value: 'Free',
            t: t,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatChip(
            icon: Icons.verified_outlined,
            label: 'Authentic',
            value: 'Guaranteed',
            t: t,
          ),
        ),
      ],
    );
  }
}
