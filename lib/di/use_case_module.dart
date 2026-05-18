import 'package:productify/domain/usecase/favorite/add_favorite_use_case.dart';
import 'package:productify/domain/usecase/favorite/clear_favorites_use_case.dart';
import 'package:productify/domain/usecase/favorite/get_favorites_use_case.dart';
import 'package:productify/domain/usecase/favorite/is_favorite_use_case.dart';
import 'package:productify/domain/usecase/favorite/remove_favorite_use_case.dart';
import 'package:productify/domain/usecase/onboarding/check_onboarding_status_use_case.dart';
import 'package:productify/domain/usecase/onboarding/set_onboarding_status_use_case.dart';
import 'package:productify/domain/usecase/product/get_all_products_use_case.dart';
import 'package:productify/injection_container.dart';

Future<void> setUpUseCaseModule() async {
  await setUpOnboardingUseCaseModule();
  await setUpProductUseCaseModule();
  await setUpFavoriteUseCaseModule();
}

Future<void> setUpOnboardingUseCaseModule() async {
  getIt.registerLazySingleton(
    () => CheckOnboardingStatusUseCase(onboardingRepository: getIt()),
  );

  getIt.registerLazySingleton(
    () => SetOnboardingStatusUseCase(onboardingRepository: getIt()),
  );
}

Future<void> setUpProductUseCaseModule() async {
  getIt.registerLazySingleton(
    () => GetAllProductsUseCase(productRepository: getIt()),
  );
}

Future<void> setUpFavoriteUseCaseModule() async {
  getIt.registerLazySingleton(
    () => AddFavoriteUseCase(favoriteRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => RemoveFavoriteUseCase(favoriteRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => GetFavoritesUseCase(favoriteRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => IsFavoriteUseCase(favoriteRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => ClearFavoritesUseCase(favoriteRepository: getIt()),
  );
}
