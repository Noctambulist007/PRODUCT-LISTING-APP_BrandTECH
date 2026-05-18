import 'package:productify/domain/repository/favorite_repository.dart';

class IsFavoriteUseCase {
  final FavoriteRepository _favoriteRepository;

  IsFavoriteUseCase({required FavoriteRepository favoriteRepository})
    : _favoriteRepository = favoriteRepository;

  Future<bool> call(int productId) async {
    return await _favoriteRepository.isFavorite(productId);
  }
}
