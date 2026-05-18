import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/home/notifier/provider.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';
import 'package:productify/presentation/screen/home/widget/category_filter_bar.dart';
import 'package:productify/presentation/screen/home/widget/empty_search_view.dart';
import 'package:productify/presentation/screen/home/widget/error_view.dart';
import 'package:productify/presentation/screen/home/widget/home_header.dart';
import 'package:productify/presentation/screen/home/widget/loading_shimmer_grid.dart';
import 'package:productify/presentation/screen/home/widget/product_grid.dart';
import 'package:productify/presentation/screen/home/widget/product_search_bar.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';
import 'package:productify/domain/util/routes.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  late final AnimationController _headerAnim = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  )..forward();

  late final Animation<double> _headerFade = CurvedAnimation(
    parent: _headerAnim,
    curve: Curves.easeOut,
  );

  late final Animation<Offset> _headerSlide = Tween<Offset>(
    begin: const Offset(0, -0.12),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _headerAnim, curve: Curves.easeOutCubic));

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _headerAnim.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      ref.read(productNotifierProvider.notifier).loadMore();
    }
  }

  Future<void> _onRefresh() async {
    _searchController.clear();
    await ref.read(productNotifierProvider.notifier).refresh();
  }

  void _navigateToDetail(Product product) {
    Navigator.pushNamed(context, AppRoutes.detail, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productNotifierProvider);
    final t = context.appTheme;

    return Scaffold(
      backgroundColor: t.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          color: t.accent,
          backgroundColor: t.surface,
          strokeWidth: 2.5,
          displacement: 16,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverToBoxAdapter(
                child: SlideTransition(
                  position: _headerSlide,
                  child: FadeTransition(
                    opacity: _headerFade,
                    child: HomeHeader(t: t),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: ProductSearchBar(
                  controller: _searchController,
                  onChanged: (q) =>
                      ref.read(productNotifierProvider.notifier).search(q),
                  onClear: () {
                    _searchController.clear();
                    ref.read(productNotifierProvider.notifier).search('');
                  },
                ),
              ),
              if (state is SuccessState)
                SliverToBoxAdapter(
                  child: CategoryFilterBar(
                    products: state.products,
                    onSelected: (cat) => ref
                        .read(productNotifierProvider.notifier)
                        .filterByCategory(cat),
                    onClearFilter: () => ref
                        .read(productNotifierProvider.notifier)
                        .clearFilters(),
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              switch (state) {
                LoadingState() => const SliverToBoxAdapter(
                  child: LoadingShimmerGrid(),
                ),
                ErrorState(:final message) => SliverToBoxAdapter(
                  child: ErrorView(
                    message: message,
                    onRetry: () =>
                        ref.read(productNotifierProvider.notifier).refresh(),
                  ),
                ),
                SuccessState(
                    :final filtered,
                    :final hasMore,
                    :final isLoadingMore
                ) =>
                filtered.isEmpty
                    ? SliverToBoxAdapter(
                  child:
                  EmptySearchView(query: _searchController.text),
                )
                    : ProductGrid(
                  products: filtered,
                  hasMore: hasMore,
                  isLoadingMore: isLoadingMore,
                  onProductTap: _navigateToDetail,
                ),
                _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
              },
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
        ),
      ),
    );
  }
}