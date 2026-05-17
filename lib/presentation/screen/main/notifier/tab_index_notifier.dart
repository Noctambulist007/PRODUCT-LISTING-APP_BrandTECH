import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class TabIndexNotifier extends StateNotifier<int> {
  TabIndexNotifier() : super(0);

  void setIndex(int index) => state = index;
}
