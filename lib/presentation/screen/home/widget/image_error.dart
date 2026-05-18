import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class ImageError extends StatelessWidget {
  const ImageError({super.key, required this.t});

  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: t.surfaceDeep,
      child: Center(
        child: Icon(Icons.image_not_supported_outlined, color: t.textTertiary),
      ),
    );
  }
}
