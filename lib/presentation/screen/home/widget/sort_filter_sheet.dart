import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/enum/product/product_sort.dart';
import 'package:productify/presentation/screen/home/notifier/provider.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';
import 'package:productify/presentation/screen/home/widget/sort_chip.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class SortFilterSheet extends ConsumerWidget {
  const SortFilterSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const SortFilterSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.appTheme;
    final state = ref.watch(productNotifierProvider);
    final currentSort = state is SuccessState ? state.sort : ProductSort.none;

    void onSelect(ProductSort sort) {
      ref.read(productNotifierProvider.notifier).sortBy(sort);
      Navigator.pop(context);
    }

    return Container(
      decoration: BoxDecoration(
        color: t.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border(top: BorderSide(color: t.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 3,
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: t.border,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),

              Row(
                children: [
                  Text(
                    'Sort By',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: t.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  if (currentSort != ProductSort.none)
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(productNotifierProvider.notifier)
                            .sortBy(ProductSort.none);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: t.surfaceDeep,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: t.border),
                        ),
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: t.textSecondary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  SortChip(
                    t: t,
                    icon: Icons.arrow_upward_rounded,
                    label: 'Low → High',
                    selected: currentSort == ProductSort.priceLowToHigh,
                    onTap: () => onSelect(ProductSort.priceLowToHigh),
                  ),
                  const SizedBox(width: 8),
                  SortChip(
                    t: t,
                    icon: Icons.arrow_downward_rounded,
                    label: 'High → Low',
                    selected: currentSort == ProductSort.priceHighToLow,
                    onTap: () => onSelect(ProductSort.priceHighToLow),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SortChip(
                    t: t,
                    icon: Icons.sort_by_alpha_rounded,
                    label: 'A → Z',
                    selected: currentSort == ProductSort.nameAZ,
                    onTap: () => onSelect(ProductSort.nameAZ),
                  ),
                  const SizedBox(width: 8),
                  SortChip(
                    t: t,
                    icon: Icons.star_rounded,
                    label: 'Top Rated',
                    selected: currentSort == ProductSort.topRated,
                    onTap: () => onSelect(ProductSort.topRated),
                  ),
                  const SizedBox(width: 8),
                  SortChip(
                    t: t,
                    icon: Icons.sort_by_alpha_rounded,
                    label: 'Z → A',
                    selected: currentSort == ProductSort.nameZA,
                    onTap: () => onSelect(ProductSort.nameZA),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
