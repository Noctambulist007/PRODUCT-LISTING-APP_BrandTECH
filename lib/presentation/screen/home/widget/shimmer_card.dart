import 'package:flutter/material.dart';
import 'package:productify/presentation/screen/home/widget/image_panel.dart';
import 'package:productify/presentation/screen/home/widget/info_panel.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key, required this.imageOnRight});

  final bool imageOnRight;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final baseColor = isDark
        ? const Color(0xFF2C2C2C)
        : const Color(0xFFE0E0E0);
    final highlightColor = isDark
        ? const Color(0xFF4A4A4A)
        : const Color(0xFFF8F8F8);

    final cardColor = isDark
        ? const Color(0xFF1E1E1E)
        : const Color(0xFFECECEC);
    final borderColor = isDark
        ? const Color(0xFF333333)
        : const Color(0xFFD6D6D6);

    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      clipBehavior: Clip.hardEdge,
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Row(
          children: imageOnRight
              ? [const InfoPanel(), const ImagePanel()]
              : [const ImagePanel(), const InfoPanel()],
        ),
      ),
    );
  }
}
