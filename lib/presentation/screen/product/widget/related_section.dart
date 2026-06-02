import 'package:flutter/material.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/product/widget/related_card.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class RelatedSection extends StatelessWidget {
  const RelatedSection({
    super.key,
    required this.related,
    required this.t,
    required this.onTap,
  });

  final List<Product> related;
  final AppThemeExtension t;
  final ValueChanged<Product> onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
          child: Row(
            children: [
              Text(
                'YOU MAY ALSO LIKE',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: t.textTertiary,
                  letterSpacing: 1.4,
                ),
              ),
              const Spacer(),
              Text(
                '${related.length} items',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: t.textTertiary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: related.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (_, i) => RelatedCard(
              product: related[i],
              t: t,
              onTap: () => onTap(related[i]),
            ),
          ),
        ),
      ],
    );
  }
}
