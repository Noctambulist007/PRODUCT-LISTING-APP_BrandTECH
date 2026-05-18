import 'package:flutter/material.dart';
import 'package:productify/presentation/screen/home/widget/shimmer_card.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class LoadMoreIndicator extends StatelessWidget {
  const LoadMoreIndicator({super.key, required this.t});

  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return const ShimmerCard(imageOnRight: false);
  }
}
