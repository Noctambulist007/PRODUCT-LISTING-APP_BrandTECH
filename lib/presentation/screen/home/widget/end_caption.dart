import 'package:flutter/material.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class EndCaption extends StatelessWidget {
  const EndCaption({super.key, required this.t});

  final AppThemeExtension t;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: t.accentSurface,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_rounded,
              color: t.accent,
              size: 20,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'All caught up',
            style: TextStyle(
              color: t.textTertiary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}