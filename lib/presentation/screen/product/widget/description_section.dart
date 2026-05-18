import 'package:flutter/material.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class DescriptionSection extends StatefulWidget {
  const DescriptionSection({super.key, required this.product, required this.t});

  final Product product;
  final AppThemeExtension t;

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final t = widget.t;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DESCRIPTION',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            color: t.textTertiary,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 10),
        AnimatedCrossFade(
          firstChild: Text(
            widget.product.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: t.textSecondary, height: 1.7),
          ),
          secondChild: Text(
            widget.product.description,
            style: TextStyle(fontSize: 14, color: t.textSecondary, height: 1.7),
          ),
          crossFadeState: _expanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 250),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Row(
            children: [
              Text(
                _expanded ? 'Show less' : 'Read more',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: t.accent,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                _expanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                size: 16,
                color: t.accent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
