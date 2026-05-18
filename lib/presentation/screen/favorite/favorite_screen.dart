import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/dialog/clear_favorites_dialog.dart';
import 'package:productify/presentation/screen/favorite/notifier/provider.dart';
import 'package:productify/presentation/screen/favorite/state/favorite_ui_state.dart';
import 'package:productify/presentation/screen/favorite/widget/empty_favorites_view.dart';
import 'package:productify/presentation/screen/home/widget/animated_card.dart';
import 'package:productify/presentation/screen/home/widget/product_card.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';
import 'package:productify/domain/util/routes.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen>
    with SingleTickerProviderStateMixin {
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
  void dispose() {
    _headerAnim.dispose();
    super.dispose();
  }

  void _navigateToDetail(Product product) {
    Navigator.pushNamed(context, AppRoutes.detail, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(favoriteNotifierProvider);
    final t = context.appTheme;

    final hasFavs = state is SuccessState && state.favorites.isNotEmpty;

    return Scaffold(
      backgroundColor: t.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideTransition(
              position: _headerSlide,
              child: FadeTransition(
                opacity: _headerFade,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: t.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: t.border),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: t.textPrimary,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Favorites',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: t.textPrimary,
                                    letterSpacing: -0.5,
                                    height: 1.1,
                                  ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Your handpicked selection',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: t.textSecondary,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      if (hasFavs)
                        GestureDetector(
                          onTap: () => ClearFavoritesDialog.show(
                            context,
                            t: t,
                            onClear: () {
                              ref
                                  .read(favoriteNotifierProvider.notifier)
                                  .clearAll();
                            },
                          ),

                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: t.errorSurface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: t.errorColor.withOpacity(0.3),
                              ),
                            ),
                            child: Icon(
                              Icons.delete_sweep_rounded,
                              color: t.errorColor,
                              size: 20,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: switch (state) {
                LoadingState() => const Center(
                  child: CircularProgressIndicator(),
                ),
                ErrorState(:final message) => Center(
                  child: Text(message, style: TextStyle(color: t.errorColor)),
                ),
                SuccessState(:final favorites) =>
                  favorites.isEmpty
                      ? EmptyFavoritesView(t: t)
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          physics: const BouncingScrollPhysics(),
                          itemCount: favorites.length,
                          itemBuilder: (context, index) {
                            final product = favorites[index];
                            final delay = Duration(
                              milliseconds: (index * 50).clamp(0, 300),
                            );

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: AnimatedCard(
                                delay: delay,
                                child: ProductCard(
                                  product: product,
                                  index: index,
                                  onTap: () => _navigateToDetail(product),
                                ),
                              ),
                            );
                          },
                        ),
                _ => const SizedBox.shrink(),
              },
            ),
          ],
        ),
      ),
    );
  }
}
