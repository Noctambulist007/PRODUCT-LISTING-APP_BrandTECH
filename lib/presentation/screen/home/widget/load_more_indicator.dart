import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class LoadMoreIndicator extends StatelessWidget {
  const LoadMoreIndicator({super.key, required this.t});

  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(strokeWidth: 2, color: t.accent),
      ),
    );
  }
}
