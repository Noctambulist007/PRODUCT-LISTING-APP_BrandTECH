
import 'package:productify/data/datasource/remote/api/product_api.dart';
import 'package:productify/data/datasource/remote/model/response/product/product_response.dart';
import 'package:productify/data/datasource/remote/util/api_client.dart';
import 'package:productify/data/mapper/product/product_response_mapper.dart';
import 'package:productify/domain/model/product/product.dart';

class ProductApiImpl extends ProductApi {
  final ApiClient _client;

  static const getAllProductsUrl = 'products';

  ProductApiImpl({required ApiClient client}) : _client = client;

  @override
  Future<List<Product>> getAllProducts({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _client.get<JSONList, List<ProductResponse>>(
        path: getAllProductsUrl,
        queryParameters: {
          'page': page.toString(),
          'limit': limit.toString(),
        },
        converter: (jsonList) {
          return jsonList
              .map((json) => ProductResponse.fromJson(json as Map<String, dynamic>))
              .toList();
        },
      );
      return response.map((e) => e.toDomain()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
