import 'package:productify/data/datasource/remote/api/product_api.dart';
import 'package:productify/data/repository/source/remote/product_remote_data_source.dart';
import 'package:productify/domain/model/product/product.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final ProductApi _productApi;

  ProductRemoteDataSourceImpl({required ProductApi productApi})
    : _productApi = productApi;

  @override
  Future<List<Product>> getAllProducts({
    required int page,
    required int limit,
  }) async {
    var response = await _productApi.getAllProducts(page: page, limit: limit);
    return response;
  }
}
