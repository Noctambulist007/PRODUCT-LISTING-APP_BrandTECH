import 'package:productify/domain/model/product/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getAllProducts({required int page, required int limit});
}
