import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productify/domain/enum/product/product_sort.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/usecase/product/get_all_products_use_case.dart';
import 'package:productify/domain/util/failure.dart';
import 'package:productify/domain/util/result.dart';
import 'package:productify/injection_container.dart';
import 'package:productify/presentation/screen/home/notifier/provider.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';

import '../mocks/fake_product_repository.dart';
import '../mocks/test_helpers.dart';

// ─── Tests ──────────────────────────────────────────────────────────────────

void main() {
  late FakeProductRepository fakeRepo;

  setUp(() async {
    fakeRepo = FakeProductRepository();
    await getIt.reset();
    getIt.registerSingleton<GetAllProductsUseCase>(
      GetAllProductsUseCase(productRepository: fakeRepo),
    );
  });

  tearDown(() async {
    await getIt.reset();
  });

  // ── Initial state ──────────────────────────────────────────────────────────

  group('ProductNotifier – initial state', () {
    test('initial state is loading before fetch completes', () {
      fakeRepo.products = makeProducts(5);

      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Immediately after build(), before the async fetch resolves
      expect(container.read(productNotifierProvider), isA<LoadingState>());
    });

    test('transitions to SuccessState after fetch resolves', () async {
      fakeRepo.products = makeProducts(5);

      final container = ProviderContainer();
      addTearDown(container.dispose);

      await pumpUntilSettled(container);

      final state = container.read(productNotifierProvider);
      expect(state, isA<SuccessState>());

      final success = state as SuccessState;
      expect(success.products.length, 5);
      expect(success.filtered.length, 5);
    });

    test('transitions to ErrorState when repository throws', () async {
      fakeRepo.shouldFail = true;

      final container = ProviderContainer();
      addTearDown(container.dispose);

      await pumpUntilSettled(container);

      final state = container.read(productNotifierProvider);
      expect(state, isA<ErrorState>());
      expect((state as ErrorState).message, 'No Internet connection');
    });
  });

  // ── hasMore flag ───────────────────────────────────────────────────────────

  group('ProductNotifier – hasMore flag', () {
    test('hasMore is true when products.length == limit (10)', () async {
      fakeRepo.products = makeProducts(10);

      final container = ProviderContainer();
      addTearDown(container.dispose);

      await pumpUntilSettled(container);

      final success = container.read(productNotifierProvider) as SuccessState;
      expect(success.hasMore, true);
    });

    test('hasMore is false when products.length < limit', () async {
      fakeRepo.products = makeProducts(3);

      final container = ProviderContainer();
      addTearDown(container.dispose);

      await pumpUntilSettled(container);

      final success = container.read(productNotifierProvider) as SuccessState;
      expect(success.hasMore, false);
    });
  });

  // ── Search ─────────────────────────────────────────────────────────────────

  group('ProductNotifier – search()', () {
    test('filters products by title (case-insensitive)', () async {
      fakeRepo.products = [
        makeProduct(id: 1, title: 'Apple Watch'),
        makeProduct(id: 2, title: 'Galaxy Phone'),
        makeProduct(id: 3, title: 'apple iPad'),
      ];

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container.read(productNotifierProvider.notifier).search('apple');

      final success = container.read(productNotifierProvider) as SuccessState;
      expect(success.filtered.length, 2);
      expect(success.filtered.map((p) => p.id), containsAll([1, 3]));
    });

    test('filters products by category (search by category name)', () async {
      fakeRepo.products = [
        makeProduct(id: 1, title: 'Widget', category: 'electronics'),
        makeProduct(id: 2, title: 'Gadget', category: 'jewelry'),
      ];

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container.read(productNotifierProvider.notifier).search('electronics');

      final success = container.read(productNotifierProvider) as SuccessState;
      expect(success.filtered.length, 1);
      expect(success.filtered.first.id, 1);
    });

    test('empty query returns all products', () async {
      fakeRepo.products = makeProducts(5);

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container.read(productNotifierProvider.notifier).search('');

      final success = container.read(productNotifierProvider) as SuccessState;
      expect(success.filtered.length, 5);
    });

    test('query with no matches returns empty filtered list', () async {
      fakeRepo.products = makeProducts(5);

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container
          .read(productNotifierProvider.notifier)
          .search('zzz_no_match');

      final success = container.read(productNotifierProvider) as SuccessState;
      expect(success.filtered, isEmpty);
    });
  });

  // ── Category filter ────────────────────────────────────────────────────────

  group('ProductNotifier – filterByCategory()', () {
    test('returns only products matching the category', () async {
      fakeRepo.products = [
        makeProduct(id: 1, category: 'electronics'),
        makeProduct(id: 2, category: 'jewelry'),
        makeProduct(id: 3, category: 'electronics'),
      ];

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container
          .read(productNotifierProvider.notifier)
          .filterByCategory('electronics');

      final success = container.read(productNotifierProvider) as SuccessState;
      expect(success.filtered.length, 2);
      expect(success.filtered.every((p) => p.category == 'electronics'), true);
    });

    test('empty category string returns all products', () async {
      fakeRepo.products = makeProducts(4);

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container.read(productNotifierProvider.notifier).filterByCategory('');

      final success = container.read(productNotifierProvider) as SuccessState;
      expect(success.filtered.length, 4);
    });
  });

  // ── Sort ───────────────────────────────────────────────────────────────────

  group('ProductNotifier – sortBy()', () {
    test('priceLowToHigh sorts ascending', () async {
      fakeRepo.products = [
        makeProduct(id: 1, price: 50.0),
        makeProduct(id: 2, price: 10.0),
        makeProduct(id: 3, price: 30.0),
      ];

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container
          .read(productNotifierProvider.notifier)
          .sortBy(ProductSort.priceLowToHigh);

      final success = container.read(productNotifierProvider) as SuccessState;
      final prices = success.filtered.map((p) => p.price).toList();
      expect(prices, [10.0, 30.0, 50.0]);
    });

    test('priceHighToLow sorts descending', () async {
      fakeRepo.products = [
        makeProduct(id: 1, price: 50.0),
        makeProduct(id: 2, price: 10.0),
        makeProduct(id: 3, price: 30.0),
      ];

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container
          .read(productNotifierProvider.notifier)
          .sortBy(ProductSort.priceHighToLow);

      final success = container.read(productNotifierProvider) as SuccessState;
      final prices = success.filtered.map((p) => p.price).toList();
      expect(prices, [50.0, 30.0, 10.0]);
    });

    test('topRated sorts by rating descending', () async {
      fakeRepo.products = [
        makeProduct(id: 1, rate: 3.0),
        makeProduct(id: 2, rate: 5.0),
        makeProduct(id: 3, rate: 4.0),
      ];

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container
          .read(productNotifierProvider.notifier)
          .sortBy(ProductSort.topRated);

      final success = container.read(productNotifierProvider) as SuccessState;
      final ids = success.filtered.map((p) => p.id).toList();
      expect(ids, [2, 3, 1]);
    });

    test('nameAZ sorts alphabetically ascending', () async {
      fakeRepo.products = [
        makeProduct(id: 1, title: 'Zebra'),
        makeProduct(id: 2, title: 'Apple'),
        makeProduct(id: 3, title: 'Mango'),
      ];

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container
          .read(productNotifierProvider.notifier)
          .sortBy(ProductSort.nameAZ);

      final success = container.read(productNotifierProvider) as SuccessState;
      final titles = success.filtered.map((p) => p.title).toList();
      expect(titles, ['Apple 2', 'Mango 3', 'Zebra 1']);
    });

    test('nameZA sorts alphabetically descending', () async {
      fakeRepo.products = [
        makeProduct(id: 1, title: 'Zebra'),
        makeProduct(id: 2, title: 'Apple'),
        makeProduct(id: 3, title: 'Mango'),
      ];

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container
          .read(productNotifierProvider.notifier)
          .sortBy(ProductSort.nameZA);

      final success = container.read(productNotifierProvider) as SuccessState;
      final titles = success.filtered.map((p) => p.title).toList();
      expect(titles, ['Zebra 1', 'Mango 3', 'Apple 2']);
    });

    test('sort state is stored and returned in SuccessState', () async {
      fakeRepo.products = makeProducts(3);

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      container
          .read(productNotifierProvider.notifier)
          .sortBy(ProductSort.topRated);

      final success = container.read(productNotifierProvider) as SuccessState;
      expect(success.sort, ProductSort.topRated);
    });
  });

  // ── clearFilters() ─────────────────────────────────────────────────────────

  group('ProductNotifier – clearFilters()', () {
    test('resets search, category, and sort – returns all products', () async {
      fakeRepo.products = [
        makeProduct(id: 1, title: 'Alpha', category: 'electronics'),
        makeProduct(id: 2, title: 'Beta', category: 'jewelry'),
      ];

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      final notifier = container.read(productNotifierProvider.notifier);
      notifier.search('Alpha');
      notifier.filterByCategory('electronics');
      notifier.sortBy(ProductSort.priceLowToHigh);

      var success = container.read(productNotifierProvider) as SuccessState;
      // Only "Alpha 1" matches both search + category filter
      expect(success.filtered.length, 1);

      notifier.clearFilters();

      success = container.read(productNotifierProvider) as SuccessState;
      expect(success.filtered.length, 2);
      expect(success.sort, ProductSort.none);
    });
  });

  // ── refresh() ─────────────────────────────────────────────────────────────

  group('ProductNotifier – refresh()', () {
    test('refresh re-fetches and restores SuccessState with new data',
        () async {
      fakeRepo.products = makeProducts(3);

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      // Swap repo data, then refresh
      fakeRepo.products = makeProducts(7);
      await container.read(productNotifierProvider.notifier).refresh();

      final success = container.read(productNotifierProvider) as SuccessState;
      expect(success.products.length, 7);
    });

    test('refresh puts state into LoadingState before resolving', () async {
      fakeRepo.products = makeProducts(2);

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      // Start the refresh and immediately inspect state
      final refreshFuture =
          container.read(productNotifierProvider.notifier).refresh();
      expect(container.read(productNotifierProvider), isA<LoadingState>());
      await refreshFuture;
    });
  });

  // ── loadMore() ─────────────────────────────────────────────────────────────

  group('ProductNotifier – loadMore()', () {
    test('loadMore fetches more products when hasMore is true', () async {
      fakeRepo.products = makeProducts(10);

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      var success = container.read(productNotifierProvider) as SuccessState;
      expect(success.products.length, 10);
      expect(success.hasMore, true);

      // After loadMore (limit becomes 20), return 15 products
      fakeRepo.products = makeProducts(15);
      await container.read(productNotifierProvider.notifier).loadMore();

      success = container.read(productNotifierProvider) as SuccessState;
      expect(success.products.length, 15);
      // 15 < 20 so hasMore = false
      expect(success.hasMore, false);
    });

    test('loadMore is a no-op when hasMore is false', () async {
      fakeRepo.products = makeProducts(3); // 3 < 10 → hasMore = false

      final container = ProviderContainer();
      addTearDown(container.dispose);
      await pumpUntilSettled(container);

      var success = container.read(productNotifierProvider) as SuccessState;
      expect(success.hasMore, false);

      // Even with new data in repo, loadMore must not trigger a fetch
      fakeRepo.products = makeProducts(8);
      await container.read(productNotifierProvider.notifier).loadMore();

      success = container.read(productNotifierProvider) as SuccessState;
      expect(success.products.length, 3); // unchanged
    });
  });

  // ── GetAllProductsUseCase ──────────────────────────────────────────────────

  group('GetAllProductsUseCase', () {
    test('returns SuccessResult with correct product list on success', () async {
      fakeRepo.products = makeProducts(5);
      final useCase = GetAllProductsUseCase(productRepository: fakeRepo);

      final result = await useCase(page: 1, limit: 5);
      expect(result, isA<SuccessResult<List<Product>>>());
      expect((result as SuccessResult<List<Product>>).value.length, 5);
    });

    test('respects the limit parameter', () async {
      fakeRepo.products = makeProducts(10);
      final useCase = GetAllProductsUseCase(productRepository: fakeRepo);

      final result = await useCase(page: 1, limit: 4);
      expect(result, isA<SuccessResult<List<Product>>>());
      expect((result as SuccessResult<List<Product>>).value.length, 4);
    });

    test('returns FailureResult when repository throws', () async {
      fakeRepo.shouldFail = true;
      final useCase = GetAllProductsUseCase(productRepository: fakeRepo);

      final result = await useCase(page: 1, limit: 10);
      expect(result, isA<FailureResult<List<Product>>>());
      final failure = (result as FailureResult<List<Product>>).failure;
      expect(failure, isA<Failure>());
      expect(failure.message, 'No Internet connection');
    });
  });

  // ── ProductSort enum labels ────────────────────────────────────────────────

  group('ProductSort – labels', () {
    test('label returns correct display string for each variant', () {
      expect(ProductSort.none.label, 'Default');
      expect(ProductSort.priceLowToHigh.label, 'Price: Low to High');
      expect(ProductSort.priceHighToLow.label, 'Price: High to Low');
      expect(ProductSort.topRated.label, 'Top Rated');
      expect(ProductSort.nameAZ.label, 'Name: A → Z');
      expect(ProductSort.nameZA.label, 'Name: Z → A');
    });

    test('shortLabel returns correct compact string for each variant', () {
      expect(ProductSort.none.shortLabel, 'Sort');
      expect(ProductSort.priceLowToHigh.shortLabel, 'Low → High');
      expect(ProductSort.priceHighToLow.shortLabel, 'High → Low');
      expect(ProductSort.topRated.shortLabel, 'Top Rated');
      expect(ProductSort.nameAZ.shortLabel, 'A → Z');
      expect(ProductSort.nameZA.shortLabel, 'Z → A');
    });
  });
}
