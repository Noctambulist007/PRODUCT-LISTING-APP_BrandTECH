import 'package:productify/domain/usecase/product/get_all_products_use_case.dart';
import 'package:productify/injection_container.dart';

Future<void> setUpUseCaseModule() async {
  await setUpProductUseCaseModule();
}

Future<void> setUpProductUseCaseModule() async {
  getIt.registerLazySingleton(
    () => GetAllProductsUseCase(productRepository: getIt()),
  );
}
