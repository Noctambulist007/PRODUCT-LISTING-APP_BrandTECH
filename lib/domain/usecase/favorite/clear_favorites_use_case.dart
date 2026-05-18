import 'package:productify/domain/repository/favorite_repository.dart';

class ClearFavoritesUseCase {
  final FavoriteRepository _favoriteRepository;

  ClearFavoritesUseCase({required FavoriteRepository favoriteRepository})
    : _favoriteRepository = favoriteRepository;

  Future<void> call() async {
    await _favoriteRepository.clearAllFavorites();
  }
}
