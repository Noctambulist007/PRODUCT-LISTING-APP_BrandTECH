import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/enum/product/product_sort.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/home/notifier/provider.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';
import 'package:productify/presentation/screen/home/widget/category_chip.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class CategoryFilterBar extends ConsumerWidget {
  const CategoryFilterBar({
    super.key,
    required this.products,
    required this.onSelected,
    required this.onClearFilter,
  });

  final List<Product> products;
  final ValueChanged<String> onSelected;
  final VoidCallback onClearFilter;

  List<String> _categories() =>
      (products.map((p) => p.category).toSet().toList()..sort());

  String _formatCat(String cat) => cat
      .split(' ')
      .map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1)}' : w)
      .join(' ');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.appTheme;
    final state = ref.watch(productNotifierProvider);
    final currentSort = state is SuccessState ? state.sort : ProductSort.none;
    final isSortActive = currentSort != ProductSort.none;
    final cats = _categories();
    if (cats.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        itemCount: cats.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          if (i == 0) {
            final isAll =
                state is SuccessState &&
                state.filtered.length == state.products.length &&
                !isSortActive;
            return CategoryChip(
              label: 'All',
              isSelected: isAll,
              t: t,
              onTap: onClearFilter,
            );
          }

          final cat = cats[i - 1];
          final isSelected =
              state is SuccessState &&
              state.filtered.isNotEmpty &&
              state.filtered.every(
                (p) => p.category.toLowerCase() == cat.toLowerCase(),
              ) &&
              state.filtered.length != state.products.length;

          return CategoryChip(
            label: _formatCat(cat),
            isSelected: isSelected,
            t: t,
            onTap: () => isSelected ? onClearFilter() : onSelected(cat),
          );
        },
      ),
    );
  }
}
