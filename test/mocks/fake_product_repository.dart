import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/repository/product_repository.dart';
import 'package:productify/domain/util/failure.dart';

class FakeProductRepository implements ProductRepository {
  /// Products to return on the next call. Set this per-test.
  List<Product> products = [];

  /// If true the next call will throw a Failure.
  bool shouldFail = false;

  @override
  Future<List<Product>> getAllProducts({
    required int page,
    required int limit,
  }) async {
    if (shouldFail) {
      throw const Failure.socketException(message: 'No Internet connection');
    }
    // honour limit
    return products.take(limit).toList();
  }
}
