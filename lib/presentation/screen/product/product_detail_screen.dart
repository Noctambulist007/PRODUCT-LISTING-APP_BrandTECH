import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/presentation/screen/home/notifier/provider.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';
import 'package:productify/presentation/screen/product/widget/add_to_cart_bar.dart';
import 'package:productify/presentation/screen/product/widget/category_id_row.dart';
import 'package:productify/presentation/screen/product/widget/description_section.dart';
import 'package:productify/presentation/screen/product/widget/hero_section.dart';
import 'package:productify/presentation/screen/product/widget/price_rating_row.dart';
import 'package:productify/presentation/screen/product/widget/related_section.dart';
import 'package:productify/presentation/screen/product/widget/stats_row.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';
import 'package:productify/domain/util/routes.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  )..forward();

  Animation<double> _fade(double start, double end) => CurvedAnimation(
    parent: _ctrl,
    curve: Interval(start, end, curve: Curves.easeOut),
  );

  Animation<Offset> _slide(double start, double end) =>
      Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _ctrl,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ),
      );

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Widget _animated(double start, double end, Widget child) => FadeTransition(
    opacity: _fade(start, end),
    child: SlideTransition(position: _slide(start, end), child: child),
  );

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;
    final product = widget.product;
    final state = ref.watch(productNotifierProvider);

    final related = state is SuccessState
        ? state.products
              .where(
                (p) => p.category == product.category && p.id != product.id,
              )
              .take(8)
              .toList()
        : <Product>[];

    return Scaffold(
      backgroundColor: t.background,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: HeroSection(product: product, t: t),
          ),

          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -28),
              child: Container(
                decoration: BoxDecoration(
                  color: t.background,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 12, bottom: 8),
                        width: 36,
                        height: 4,
                        decoration: BoxDecoration(
                          color: t.border,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _animated(
                            0.0,
                            0.4,
                            CategoryIdRow(product: product, t: t),
                          ),
                          const SizedBox(height: 12),

                          _animated(
                            0.08,
                            0.45,
                            Text(
                              product.title,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: t.textPrimary,
                                    height: 1.3,
                                    letterSpacing: -0.4,
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          _animated(
                            0.15,
                            0.5,
                            PriceRatingRow(product: product, t: t),
                          ),
                          const SizedBox(height: 24),

                          _animated(
                            0.22,
                            0.58,
                            DescriptionSection(product: product, t: t),
                          ),
                          const SizedBox(height: 28),

                          _animated(
                            0.28,
                            0.65,
                            StatsRow(product: product, t: t),
                          ),
                        ],
                      ),
                    ),

                    if (related.isNotEmpty) ...[
                      const SizedBox(height: 32),
                      _animated(
                        0.35,
                        0.72,
                        RelatedSection(
                          related: related,
                          t: t,
                          onTap: (p) => Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.detail,
                            arguments: p,
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 110),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AddToCartBar(product: product, t: t),
    );
  }
}
