import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/model/rating/rating.dart';
import 'package:productify/domain/repository/favorite_repository.dart';
import 'package:productify/domain/usecase/favorite/add_favorite_use_case.dart';
import 'package:productify/domain/usecase/favorite/clear_favorites_use_case.dart';
import 'package:productify/domain/usecase/favorite/get_favorites_use_case.dart';
import 'package:productify/domain/usecase/favorite/is_favorite_use_case.dart';
import 'package:productify/domain/usecase/favorite/remove_favorite_use_case.dart';
import 'package:productify/injection_container.dart';
import 'package:productify/presentation/screen/favorite/notifier/provider.dart';
import 'package:productify/presentation/screen/favorite/state/favorite_ui_state.dart';
import 'package:productify/presentation/screen/favorite/widget/empty_favorites_view.dart';
import 'package:productify/presentation/screen/home/widget/category_chip.dart';
import 'package:productify/presentation/screen/home/widget/empty_search_view.dart';
import 'package:productify/presentation/screen/home/widget/end_caption.dart';
import 'package:productify/presentation/screen/home/widget/error_view.dart';
import 'package:productify/presentation/screen/home/widget/sort_chip.dart';
import 'package:productify/presentation/screen/home/widget/star_rating.dart';
import 'package:productify/presentation/theme/app_theme.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';

// ─── Shared test helpers ─────────────────────────────────────────────────────

Product makeProduct({int id = 1}) => Product(
      id: id,
      title: 'Test Product $id',
      price: 29.99,
      description: 'A test product description.',
      category: 'electronics',
      image: 'https://example.com/img$id.png',
      rating: Rating(rate: 4.2, count: 88),
    );

/// Hard-coded light theme colors that exactly match [AppTheme.light] so we
/// can compare decoration colors in tests WITHOUT needing ScreenUtil to be
/// initialized before the widget tree is pumped.
const _t = AppThemeExtension(
  background: Color(0xFFF8F5F0),
  surface: Color(0xFFFFFFFF),
  surfaceWarm: Color(0xFFFCF9F5),
  surfaceDeep: Color(0xFFF0EBE3),
  border: Color(0xFFE8E2D9),
  borderLight: Color(0xFFF2EDE7),
  textPrimary: Color(0xFF1A1206),
  textSecondary: Color(0xFF6B6258),
  textTertiary: Color(0xFF9C9188),
  accent: Color(0xFFF2994A),
  accentSurface: Color(0xFFFFF4EA),
  accentLight: Color(0xFFFFC07A),
  accentDark: Color(0xFFD4732E),
  star: Color(0xFFFBBF24),
  starEmpty: Color(0xFFD6CFC6),
  errorColor: Color(0xFFB91C1C),
  errorSurface: Color(0xFFFEE2E2),
);

/// Wraps [widget] in a [ScreenUtilInit] + [MaterialApp] so that
/// [AppThemeExtension] and ScreenUtil are both available.
Widget wrap(Widget widget) {
  return ProviderScope(
    child: ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (_, _) => MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(body: Center(child: widget)),
      ),
    ),
  );
}

// ─── Fake FavoriteRepository ─────────────────────────────────────────────────

class FakeFavoriteRepository implements FavoriteRepository {
  final List<Product> _favorites = [];

  @override
  Future<void> addFavorite(Product product) async {
    if (!_favorites.any((e) => e.id == product.id)) _favorites.add(product);
  }

  @override
  Future<void> removeFavorite(int productId) async {
    _favorites.removeWhere((e) => e.id == productId);
  }

  @override
  Future<List<Product>> getFavorites() async => List.from(_favorites);

  @override
  Future<bool> isFavorite(int productId) async =>
      _favorites.any((e) => e.id == productId);

  @override
  Future<void> clearAllFavorites() async => _favorites.clear();
}

Future<void> setupFakeGetIt() async {
  final fakeRepo = FakeFavoriteRepository();
  await getIt.reset();
  getIt
    ..registerSingleton<GetFavoritesUseCase>(
      GetFavoritesUseCase(favoriteRepository: fakeRepo),
    )
    ..registerSingleton<IsFavoriteUseCase>(
      IsFavoriteUseCase(favoriteRepository: fakeRepo),
    )
    ..registerSingleton<AddFavoriteUseCase>(
      AddFavoriteUseCase(favoriteRepository: fakeRepo),
    )
    ..registerSingleton<RemoveFavoriteUseCase>(
      RemoveFavoriteUseCase(favoriteRepository: fakeRepo),
    )
    ..registerSingleton<ClearFavoritesUseCase>(
      ClearFavoritesUseCase(favoriteRepository: fakeRepo),
    );
}

// ────────────────────────────────────────────────────────────────────────────
// StarRating Widget Tests
// ────────────────────────────────────────────────────────────────────────────

void main() {
  group('StarRating Widget Tests', () {
    testWidgets('renders exactly 5 star icons', (tester) async {
      await tester.pumpWidget(wrap(const StarRating(rating: 3.5)));
      await tester.pump();
      expect(find.byType(Icon), findsNWidgets(5));
    });

    testWidgets('does NOT show rating number by default', (tester) async {
      await tester.pumpWidget(wrap(const StarRating(rating: 4.0)));
      await tester.pump();
      expect(find.text('4.0'), findsNothing);
    });

    testWidgets('shows rating number when showNumber is true', (tester) async {
      await tester.pumpWidget(
        wrap(const StarRating(rating: 4.2, showNumber: true)),
      );
      await tester.pump();
      expect(find.text('4.2'), findsOneWidget);
    });

    testWidgets('all 5 stars are filled for rating 5.0', (tester) async {
      await tester.pumpWidget(wrap(const StarRating(rating: 5.0)));
      await tester.pump();

      final icons = tester
          .widgetList<Icon>(find.byType(Icon))
          .map((i) => i.icon)
          .toList();
      expect(icons.every((ico) => ico == Icons.star_rounded), true);
    });

    testWidgets('all 5 stars are empty for rating 0.0', (tester) async {
      await tester.pumpWidget(wrap(const StarRating(rating: 0.0)));
      await tester.pump();

      final icons = tester
          .widgetList<Icon>(find.byType(Icon))
          .map((i) => i.icon)
          .toList();
      expect(icons.every((ico) => ico == Icons.star_outline_rounded), true);
    });

    testWidgets('half star appears for 2.5 rating', (tester) async {
      await tester.pumpWidget(wrap(const StarRating(rating: 2.5)));
      await tester.pump();

      final icons = tester
          .widgetList<Icon>(find.byType(Icon))
          .map((i) => i.icon)
          .toList();
      expect(icons.contains(Icons.star_half_rounded), true);
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // CategoryChip Widget Tests
  // ──────────────────────────────────────────────────────────────────────────

  group('CategoryChip Widget Tests', () {
    testWidgets('displays label text', (tester) async {
      await tester.pumpWidget(
        wrap(CategoryChip(
          label: 'Electronics',
          isSelected: false,
          t: _t,
          onTap: () {},
        )),
      );
      await tester.pump();
      expect(find.text('Electronics'), findsOneWidget);
    });

    testWidgets('onTap callback is invoked when tapped', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        wrap(CategoryChip(
          label: 'Jewelry',
          isSelected: false,
          t: _t,
          onTap: () => tapped = true,
        )),
      );
      await tester.pump();

      await tester.tap(find.byType(GestureDetector).first);
      expect(tapped, true);
    });

    testWidgets('selected chip uses textPrimary as background', (tester) async {
      await tester.pumpWidget(
        wrap(CategoryChip(
          label: 'Clothing',
          isSelected: true,
          t: _t,
          onTap: () {},
        )),
      );
      await tester.pump();

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, _t.textPrimary);
    });

    testWidgets('unselected chip uses surface as background', (tester) async {
      await tester.pumpWidget(
        wrap(CategoryChip(
          label: 'Clothing',
          isSelected: false,
          t: _t,
          onTap: () {},
        )),
      );
      await tester.pump();

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, _t.surface);
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // SortChip Widget Tests
  // ──────────────────────────────────────────────────────────────────────────

  group('SortChip Widget Tests', () {
    testWidgets('renders label and icon', (tester) async {
      await tester.pumpWidget(
        wrap(Row(children: [
          SortChip(
            t: _t,
            icon: Icons.arrow_upward,
            label: 'Low → High',
            selected: false,
            onTap: () {},
          ),
        ])),
      );
      await tester.pump();

      expect(find.text('Low → High'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
    });

    testWidgets('onTap callback fires', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        wrap(Row(children: [
          SortChip(
            t: _t,
            icon: Icons.sort,
            label: 'Sort',
            selected: false,
            onTap: () => tapped = true,
          ),
        ])),
      );
      await tester.pump();

      await tester.tap(find.byType(GestureDetector).first);
      expect(tapped, true);
    });

    testWidgets('selected chip uses accentSurface background', (tester) async {
      await tester.pumpWidget(
        wrap(Row(children: [
          SortChip(
            t: _t,
            icon: Icons.star,
            label: 'Top Rated',
            selected: true,
            onTap: () {},
          ),
        ])),
      );
      await tester.pump();

      final chipContainer = tester
          .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
          .first;
      final decoration = chipContainer.decoration as BoxDecoration;
      expect(decoration.color, _t.accentSurface);
    });

    testWidgets('unselected chip uses surfaceDeep background', (tester) async {
      await tester.pumpWidget(
        wrap(Row(children: [
          SortChip(
            t: _t,
            icon: Icons.star_border,
            label: 'Default',
            selected: false,
            onTap: () {},
          ),
        ])),
      );
      await tester.pump();

      final chipContainer = tester
          .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
          .first;
      final decoration = chipContainer.decoration as BoxDecoration;
      expect(decoration.color, _t.surfaceDeep);
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // ErrorView Widget Tests
  // ──────────────────────────────────────────────────────────────────────────

  group('ErrorView Widget Tests', () {
    testWidgets('displays error message text', (tester) async {
      await tester.pumpWidget(
        wrap(ErrorView(message: 'Network failure', onRetry: () {})),
      );
      await tester.pump();
      expect(find.text('Network failure'), findsOneWidget);
    });

    testWidgets('displays "Something went wrong" heading', (tester) async {
      await tester.pumpWidget(
        wrap(ErrorView(message: 'Any error', onRetry: () {})),
      );
      await tester.pump();
      expect(find.text('Something went wrong'), findsOneWidget);
    });

    testWidgets('shows "Try again" button', (tester) async {
      await tester.pumpWidget(
        wrap(ErrorView(message: 'Error', onRetry: () {})),
      );
      await tester.pump();
      expect(find.text('Try again'), findsOneWidget);
    });

    testWidgets('onRetry is called when "Try again" is tapped', (tester) async {
      bool retried = false;

      await tester.pumpWidget(
        wrap(ErrorView(message: 'Error', onRetry: () => retried = true)),
      );
      await tester.pump();

      await tester.tap(find.text('Try again'));
      expect(retried, true);
    });

    testWidgets('shows wifi_off_rounded icon', (tester) async {
      await tester.pumpWidget(
        wrap(ErrorView(message: 'Error', onRetry: () {})),
      );
      await tester.pump();
      expect(find.byIcon(Icons.wifi_off_rounded), findsOneWidget);
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // EmptySearchView Widget Tests
  // ──────────────────────────────────────────────────────────────────────────

  group('EmptySearchView Widget Tests', () {
    testWidgets('shows "No products found" for empty query', (tester) async {
      await tester.pumpWidget(wrap(const EmptySearchView(query: '')));
      await tester.pump();
      expect(find.text('No products found'), findsOneWidget);
    });

    testWidgets('includes query in message for non-empty query', (tester) async {
      await tester.pumpWidget(
        wrap(const EmptySearchView(query: 'laptop')),
      );
      await tester.pump();
      expect(find.text('No results for "laptop"'), findsOneWidget);
    });

    testWidgets('shows search_off_rounded icon', (tester) async {
      await tester.pumpWidget(wrap(const EmptySearchView(query: '')));
      await tester.pump();
      expect(find.byIcon(Icons.search_off_rounded), findsOneWidget);
    });

    testWidgets('shows helper subtitle text', (tester) async {
      await tester.pumpWidget(wrap(const EmptySearchView(query: 'xyz')));
      await tester.pump();
      expect(
        find.text(
          'Try adjusting your search\nor clearing the category filter.',
        ),
        findsOneWidget,
      );
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // EndCaption Widget Tests
  // ──────────────────────────────────────────────────────────────────────────

  group('EndCaption Widget Tests', () {
    testWidgets('shows "All caught up" text', (tester) async {
      await tester.pumpWidget(wrap(EndCaption(t: _t)));
      await tester.pump();
      expect(find.text('All caught up'), findsOneWidget);
    });

    testWidgets('shows check_rounded icon', (tester) async {
      await tester.pumpWidget(wrap(EndCaption(t: _t)));
      await tester.pump();
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    });

    testWidgets('icon container uses accentSurface color', (tester) async {
      await tester.pumpWidget(wrap(EndCaption(t: _t)));
      await tester.pump();

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.byIcon(Icons.check_rounded),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, _t.accentSurface);
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // EmptyFavoritesView Widget Tests
  // ──────────────────────────────────────────────────────────────────────────

  group('EmptyFavoritesView Widget Tests', () {
    setUp(() async => setupFakeGetIt());
    tearDown(() async => await getIt.reset());

    testWidgets('shows "No Favorites Yet" heading', (tester) async {
      await tester.pumpWidget(wrap(EmptyFavoritesView(t: _t)));
      await tester.pump();
      expect(find.text('No Favorites Yet'), findsOneWidget);
    });

    testWidgets('shows browse subtitle text', (tester) async {
      await tester.pumpWidget(wrap(EmptyFavoritesView(t: _t)));
      await tester.pump();
      expect(
        find.text(
          'Browse through our premium selection of products and save your favorites here!',
        ),
        findsOneWidget,
      );
    });

    testWidgets('shows "Explore Products" button', (tester) async {
      await tester.pumpWidget(wrap(EmptyFavoritesView(t: _t)));
      await tester.pump();
      expect(find.text('Explore Products'), findsOneWidget);
    });

    testWidgets('shows favorite_outline_rounded icon', (tester) async {
      await tester.pumpWidget(wrap(EmptyFavoritesView(t: _t)));
      await tester.pump();
      expect(find.byIcon(Icons.favorite_outline_rounded), findsOneWidget);
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // Favorite Toggle Integration Test
  // ──────────────────────────────────────────────────────────────────────────

  group('Favorite toggle integration', () {
    setUp(() async => setupFakeGetIt());
    tearDown(() async => await getIt.reset());

    testWidgets('icon starts as unfilled, then fills after tap', (tester) async {
      final product = makeProduct(id: 42);

      await tester.pumpWidget(
        ProviderScope(
          child: ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            builder: (_, _) => MaterialApp(
              theme: AppTheme.light,
              home: Scaffold(body: _FavoriteToggleWidget(product: product)),
            ),
          ),
        ),
      );

      // Let the notifier initialize
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Not favorited yet
      expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);

      // Tap to add to favorites
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
    });
  });
}

// ─── Minimal toggle widget for the integration test ─────────────────────────

class _FavoriteToggleWidget extends ConsumerWidget {
  const _FavoriteToggleWidget({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favState = ref.watch(favoriteNotifierProvider);

    final isFav = favState is SuccessState &&
        favState.favorites.any((p) => p.id == product.id);

    return GestureDetector(
      onTap: () =>
          ref.read(favoriteNotifierProvider.notifier).toggleFavorite(product),
      child: Icon(
        isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
      ),
    );
  }
}
