import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/model/rating/rating.dart';
import 'package:productify/domain/usecase/favorite/add_favorite_use_case.dart';
import 'package:productify/domain/usecase/favorite/clear_favorites_use_case.dart';
import 'package:productify/domain/usecase/favorite/get_favorites_use_case.dart';
import 'package:productify/domain/usecase/favorite/is_favorite_use_case.dart';
import 'package:productify/domain/usecase/favorite/remove_favorite_use_case.dart';
import 'package:productify/domain/usecase/onboarding/set_onboarding_status_use_case.dart';
import 'package:productify/injection_container.dart';
import 'package:productify/presentation/screen/favorite/notifier/provider.dart';
import 'package:productify/presentation/screen/favorite/state/favorite_ui_state.dart';
import 'package:productify/presentation/screen/onboarding/notifier/provider.dart';

import '../mocks/fake_favorite_repository.dart';
import '../mocks/fake_onboarding_repository.dart';

void main() {
  group('OnboardingNotifier Unit Tests', () {
    late FakeOnboardingRepository fakeOnboardingRepo;

    setUp(() async {
      fakeOnboardingRepo = FakeOnboardingRepository();
      await getIt.reset();
      getIt.registerSingleton<SetOnboardingStatusUseCase>(
        SetOnboardingStatusUseCase(onboardingRepository: fakeOnboardingRepo),
      );
    });

    tearDown(() async {
      await getIt.reset();
    });

    test('initial state has page 0, isCompleting false, and isDone false', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(onboardingNotifierProvider);

      expect(state.currentPage, 0);
      expect(state.isCompleting, false);
      expect(state.isDone, false);
    });

    test('onPageChanged updates currentPage correctly', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(onboardingNotifierProvider.notifier);

      notifier.onPageChanged(2);
      expect(container.read(onboardingNotifierProvider).currentPage, 2);

      notifier.onPageChanged(0);
      expect(container.read(onboardingNotifierProvider).currentPage, 0);
    });

    test(
      'complete() marks onboarding as done and calls SetOnboardingStatusUseCase',
      () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(onboardingNotifierProvider.notifier);

        expect(fakeOnboardingRepo.savedStatus, isNull);

        await notifier.complete();

        final state = container.read(onboardingNotifierProvider);
        expect(state.isDone, true);
        expect(state.isCompleting, true);
        expect(fakeOnboardingRepo.savedStatus, true);
      },
    );

    test('skip() completes onboarding successfully', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(onboardingNotifierProvider.notifier);

      expect(fakeOnboardingRepo.savedStatus, isNull);

      notifier.skip();

      await Future.delayed(Duration.zero);

      final state = container.read(onboardingNotifierProvider);
      expect(state.isDone, true);
      expect(fakeOnboardingRepo.savedStatus, true);
    });
  });

  group('FavoriteNotifier Unit Tests', () {
    late FakeFavoriteRepository fakeFavRepo;
    late Product testProduct1;
    late Product testProduct2;

    setUp(() async {
      fakeFavRepo = FakeFavoriteRepository();
      await getIt.reset();
      getIt.registerSingleton<GetFavoritesUseCase>(
        GetFavoritesUseCase(favoriteRepository: fakeFavRepo),
      );
      getIt.registerSingleton<IsFavoriteUseCase>(
        IsFavoriteUseCase(favoriteRepository: fakeFavRepo),
      );
      getIt.registerSingleton<AddFavoriteUseCase>(
        AddFavoriteUseCase(favoriteRepository: fakeFavRepo),
      );
      getIt.registerSingleton<RemoveFavoriteUseCase>(
        RemoveFavoriteUseCase(favoriteRepository: fakeFavRepo),
      );
      getIt.registerSingleton<ClearFavoritesUseCase>(
        ClearFavoritesUseCase(favoriteRepository: fakeFavRepo),
      );

      testProduct1 = Product(
        id: 1,
        title: 'Product 1',
        price: 10.0,
        description: 'Desc 1',
        category: 'Cat 1',
        image: 'img1',
        rating: Rating(rate: 4.0, count: 10),
      );

      testProduct2 = Product(
        id: 2,
        title: 'Product 2',
        price: 20.0,
        description: 'Desc 2',
        category: 'Cat 2',
        image: 'img2',
        rating: Rating(rate: 5.0, count: 5),
      );
    });

    tearDown(() async {
      await getIt.reset();
    });

    test('initial state builds and loads empty favorites list', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final state = container.read(favoriteNotifierProvider);

      expect(state, const FavoriteUiState.loading());

      await Future.delayed(Duration.zero);

      final successState =
          container.read(favoriteNotifierProvider) as SuccessState;
      expect(successState.favorites, isEmpty);
    });

    test('toggleFavorite adds a product to favorites', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(favoriteNotifierProvider.notifier);
      await Future.delayed(Duration.zero);

      await notifier.toggleFavorite(testProduct1);

      final successState =
          container.read(favoriteNotifierProvider) as SuccessState;
      expect(successState.favorites.length, 1);
      expect(successState.favorites.first.id, testProduct1.id);
    });

    test('toggleFavorite removes a product if already favorited', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(favoriteNotifierProvider.notifier);
      await Future.delayed(Duration.zero);

      await notifier.toggleFavorite(testProduct1);
      var successState =
          container.read(favoriteNotifierProvider) as SuccessState;
      expect(successState.favorites.length, 1);

      await notifier.toggleFavorite(testProduct1);
      successState = container.read(favoriteNotifierProvider) as SuccessState;
      expect(successState.favorites, isEmpty);
    });

    test('removeFavorite removes product by ID', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(favoriteNotifierProvider.notifier);
      await Future.delayed(Duration.zero);

      await notifier.toggleFavorite(testProduct1);
      await notifier.toggleFavorite(testProduct2);

      var successState =
          container.read(favoriteNotifierProvider) as SuccessState;
      expect(successState.favorites.length, 2);

      await notifier.removeFavorite(testProduct1.id);

      successState = container.read(favoriteNotifierProvider) as SuccessState;
      expect(successState.favorites.length, 1);
      expect(successState.favorites.first.id, testProduct2.id);
    });

    test('clearAll removes all favorite products', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(favoriteNotifierProvider.notifier);
      await Future.delayed(Duration.zero);

      await notifier.toggleFavorite(testProduct1);
      await notifier.toggleFavorite(testProduct2);

      var successState =
          container.read(favoriteNotifierProvider) as SuccessState;
      expect(successState.favorites.length, 2);

      await notifier.clearAll();

      successState = container.read(favoriteNotifierProvider) as SuccessState;
      expect(successState.favorites, isEmpty);
    });

    test('isFavorite checks correctly', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(favoriteNotifierProvider.notifier);
      await Future.delayed(Duration.zero);

      expect(await notifier.isFavorite(testProduct1.id), false);

      await notifier.toggleFavorite(testProduct1);

      expect(await notifier.isFavorite(testProduct1.id), true);
    });
  });
}
