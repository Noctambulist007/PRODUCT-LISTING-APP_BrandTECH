import 'package:productify/domain/repository/favorite_repository.dart';

class RemoveFavoriteUseCase {
  final FavoriteRepository _favoriteRepository;

  RemoveFavoriteUseCase({required FavoriteRepository favoriteRepository})
    : _favoriteRepository = favoriteRepository;

  Future<void> call(int productId) async {
    await _favoriteRepository.removeFavorite(productId);
  }
}
