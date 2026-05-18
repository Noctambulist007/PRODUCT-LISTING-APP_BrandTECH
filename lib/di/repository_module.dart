import 'package:productify/data/repository/favorite_repository_impl.dart';
import 'package:productify/data/repository/onboarding_repository_impl.dart';
import 'package:productify/data/repository/product_repository_impl.dart';
import 'package:productify/domain/repository/favorite_repository.dart';
import 'package:productify/domain/repository/onboarding_repository.dart';
import 'package:productify/domain/repository/product_repository.dart';
import 'package:productify/injection_container.dart';

Future<void> setUpRepositoryModule() async {
  getIt.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sharedPreferences: getIt()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productRemoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(localDataSource: getIt()),
  );
}
