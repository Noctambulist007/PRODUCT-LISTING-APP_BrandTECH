import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key, required this.t});

  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: t.surfaceDeep,
      child: Center(
        child: SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 1.5, color: t.border),
        ),
      ),
    );
  }
}
