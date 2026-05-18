import 'package:productify/domain/model/product/product.dart';

abstract class ProductApi {
  Future<List<Product>> getAllProducts({required int page, required int limit});
}
