import 'package:get_it/get_it.dart';
import 'package:productify/di/cache_module.dart';
import 'package:productify/di/data_source_module.dart';
import 'package:productify/di/network_module.dart';
import 'package:productify/di/repository_module.dart';
import 'package:productify/di/service_module.dart';
import 'package:productify/di/use_case_module.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  await setUpCacheModule();
  await getIt.allReady();
  await setUpNetworkModule();
  await setUpDataSourceModule();
  await setUpRepositoryModule();
  await setUpUseCaseModule();
  await setUpServiceModule();
}
