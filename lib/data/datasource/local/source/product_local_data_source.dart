import 'package:productify/domain/model/product/product.dart';

abstract class ProductLocalDataSource {
  Future<void> addFavorite(Product product);

  Future<void> removeFavorite(int productId);

  Future<List<Product>> getFavorites();

  Future<bool> isFavorite(int productId);

  Future<void> clearAllFavorites();
}
