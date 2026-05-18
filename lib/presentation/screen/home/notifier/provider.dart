import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/presentation/screen/home/notifier/product_notifier.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';

final productNotifierProvider =
    NotifierProvider<ProductNotifier, ProductUiState>(ProductNotifier.new);
