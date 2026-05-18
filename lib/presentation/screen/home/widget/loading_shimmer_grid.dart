import 'package:flutter/material.dart';
import 'package:productify/presentation/screen/home/widget/shimmer_card.dart';

class LoadingShimmerGrid extends StatelessWidget {
  const LoadingShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ShimmerCard(imageOnRight: index.isOdd),
          ),
        ),
      ),
    );
  }
}
