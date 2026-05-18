import 'package:dio/dio.dart';
import 'package:productify/data/datasource/remote/api/product_api.dart';
import 'package:productify/data/datasource/remote/api/product_api_impl.dart';
import 'package:productify/data/datasource/remote/util/api_client.dart';
import 'package:productify/data/datasource/remote/util/logging_interceptor.dart';
import 'package:productify/injection_container.dart';

Future<void> setUpNetworkModule() async {
  const int timeOut = 30;

  const baseUrl = 'https://fakestoreapi.com/';

  getIt.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());

  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: timeOut),
        receiveTimeout: const Duration(seconds: timeOut),
      ),
    )..interceptors.addAll([getIt<LoggingInterceptor>()]),
  );

  getIt.registerLazySingleton<ApiClient>(() => ApiClient(client: getIt()));

  getIt.registerLazySingleton<ProductApi>(
    () => ProductApiImpl(client: getIt()),
  );
}
