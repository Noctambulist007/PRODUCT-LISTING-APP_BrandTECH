import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/repository/favorite_repository.dart';

class AddFavoriteUseCase {
  final FavoriteRepository _favoriteRepository;

  AddFavoriteUseCase({required FavoriteRepository favoriteRepository})
    : _favoriteRepository = favoriteRepository;

  Future<void> call(Product product) async {
    await _favoriteRepository.addFavorite(product);
  }
}
