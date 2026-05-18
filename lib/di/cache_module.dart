import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:productify/injection_container.dart';

Future<void> setUpCacheModule() async {
  await Hive.initFlutter();

  final favoritesBox = await Hive.openBox('favorites_box');
  getIt.registerSingleton<Box>(favoritesBox);

  getIt.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
}
