import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/repository/favorite_repository.dart';

class GetFavoritesUseCase {
  final FavoriteRepository _favoriteRepository;

  GetFavoritesUseCase({required FavoriteRepository favoriteRepository})
    : _favoriteRepository = favoriteRepository;

  Future<List<Product>> call() async {
    return await _favoriteRepository.getFavorites();
  }
}
