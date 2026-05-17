import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:productify/presentation/screen/main/notifier/tab_index_notifier.dart';

final tabIndexProvider = StateNotifierProvider<TabIndexNotifier, int>(
  (ref) => TabIndexNotifier(),
);
