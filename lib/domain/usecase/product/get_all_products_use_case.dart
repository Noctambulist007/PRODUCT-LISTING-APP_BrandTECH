import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/repository/product_repository.dart';
import 'package:productify/domain/util/failure.dart';
import 'package:productify/domain/util/result.dart';

class GetAllProductsUseCase {
  final ProductRepository _productRepository;

  GetAllProductsUseCase({required ProductRepository productRepository})
    : _productRepository = productRepository;

  Future<Result<List<Product>>> call({
    required int page,
    required int limit,
  }) async {
    return await _productRepository
        .getAllProducts(page: page, limit: limit)
        .then((products) => Result.success(products))
        .onError((Failure failure, stackTrace) => Result.failure(failure));
  }
}
