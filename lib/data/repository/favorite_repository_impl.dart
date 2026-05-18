import 'package:productify/data/datasource/local/source/product_local_data_source.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final ProductLocalDataSource _localDataSource;

  FavoriteRepositoryImpl({required ProductLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  @override
  Future<void> addFavorite(Product product) async {
    await _localDataSource.addFavorite(product);
  }

  @override
  Future<void> removeFavorite(int productId) async {
    await _localDataSource.removeFavorite(productId);
  }

  @override
  Future<List<Product>> getFavorites() async {
    return await _localDataSource.getFavorites();
  }

  @override
  Future<bool> isFavorite(int productId) async {
    return await _localDataSource.isFavorite(productId);
  }

  @override
  Future<void> clearAllFavorites() async {
    await _localDataSource.clearAllFavorites();
  }
}
