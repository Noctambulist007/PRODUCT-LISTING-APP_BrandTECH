import 'package:productify/data/repository/product_repository_impl.dart';
import 'package:productify/domain/repository/product_repository.dart';
import 'package:productify/injection_container.dart';

Future<void> setUpRepositoryModule() async {
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productRemoteDataSource: getIt()),
  );
}
