import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/repository/favorite_repository.dart';

class FakeFavoriteRepository implements FavoriteRepository {
  final List<Product> _favorites = [];

  @override
  Future<void> addFavorite(Product product) async {
    if (!_favorites.any((element) => element.id == product.id)) {
      _favorites.add(product);
    }
  }

  @override
  Future<void> removeFavorite(int productId) async {
    _favorites.removeWhere((element) => element.id == productId);
  }

  @override
  Future<List<Product>> getFavorites() async {
    return List.from(_favorites);
  }

  @override
  Future<bool> isFavorite(int productId) async {
    return _favorites.any((element) => element.id == productId);
  }

  @override
  Future<void> clearAllFavorites() async {
    _favorites.clear();
  }
}
