import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/model/rating/rating.dart';
import 'package:productify/presentation/screen/home/notifier/provider.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';

Product makeProduct({
  required int id,
  String title = 'Product',
  double price = 10.0,
  String category = 'cat',
  double rate = 4.0,
}) =>
    Product(
      id: id,
      title: '$title $id',
      price: price,
      description: 'Desc $id',
      category: category,
      image: 'img$id',
      rating: Rating(rate: rate, count: 10),
    );

List<Product> makeProducts(int count) =>
    List.generate(count, (i) => makeProduct(id: i + 1));

/// Pumps the event queue enough times for the notifier's async fetch to settle.
Future<void> pumpUntilSettled(ProviderContainer container) async {
  // Pump up to 20 microtask cycles; most futures resolve in 1-3 ticks.
  for (var i = 0; i < 20; i++) {
    await Future<void>.value();
    final state = container.read(productNotifierProvider);
    if (state is SuccessState || state is ErrorState) break;
  }
}
