import 'package:productify/data/repository/source/remote/product_remote_data_source.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<List<Product>> getAllProducts({
    required int page,
    required int limit,
  }) async {
    var response = await productRemoteDataSource.getAllProducts(
      page: page,
      limit: limit,
    );
    return response;
  }
}
