import 'package:flutter_riverpod/legacy.dart';
import 'package:productify/presentation/screen/home/notifier/product_notifier.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';

typedef ProductNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductUiState>;

final ProductNotifierProvider productNotifierProvider = StateNotifierProvider(
  (ref) => ProductNotifier(),
);
