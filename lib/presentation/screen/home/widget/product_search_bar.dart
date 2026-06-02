import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/enum/product/product_sort.dart';
import 'package:productify/presentation/screen/home/notifier/provider.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';
import 'package:productify/presentation/screen/home/widget/sort_filter_sheet.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

class ProductSearchBar extends ConsumerWidget {
  const ProductSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.appTheme;
    final state = ref.watch(productNotifierProvider);
    final currentSort = state is SuccessState ? state.sort : ProductSort.none;
    final isSortActive = currentSort != ProductSort.none;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: t.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: t.border),
              ),
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: TextStyle(
                  color: t.textPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  hintStyle: TextStyle(
                    color: t.textTertiary,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: t.textTertiary,
                    size: 20,
                  ),
                  suffixIcon: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: controller,
                    builder: (_, val, _) => val.text.isEmpty
                        ? const SizedBox.shrink()
                        : GestureDetector(
                            onTap: onClear,
                            child: Icon(
                              Icons.close_rounded,
                              color: t.textTertiary,
                              size: 18,
                            ),
                          ),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 13),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: () => SortFilterSheet.show(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: isSortActive ? t.textPrimary : t.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isSortActive ? t.textPrimary : t.border,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.tune_rounded,
                    size: 20,
                    color: isSortActive ? t.background : t.textSecondary,
                  ),
                  if (isSortActive)
                    Positioned(
                      top: 9,
                      right: 9,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: t.accent,
                          shape: BoxShape.circle,
                          border: Border.all(color: t.textPrimary, width: 1),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
