import 'package:productify/domain/model/product/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts({required int page, required int limit});
}
