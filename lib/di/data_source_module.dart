import 'package:productify/data/datasource/remote/source/product_remote_data_source_impl.dart';
import 'package:productify/data/repository/source/remote/product_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:productify/injection_container.dart';

Future<void> setUpDataSourceModule() async {
  await setUpLocalDataSourceModule();
  await setUpRemoteDataSourceModule();
}

Future<void> setUpLocalDataSourceModule() async {
  await getIt.isReady<SharedPreferences>();
}

Future<void> setUpRemoteDataSourceModule() async {
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(productApi: getIt()),
  );
}
