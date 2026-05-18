import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/usecase/favorite/add_favorite_use_case.dart';
import 'package:productify/domain/usecase/favorite/remove_favorite_use_case.dart';
import 'package:productify/domain/usecase/favorite/get_favorites_use_case.dart';
import 'package:productify/domain/usecase/favorite/is_favorite_use_case.dart';
import 'package:productify/domain/usecase/favorite/clear_favorites_use_case.dart';
import 'package:productify/injection_container.dart';
import 'package:productify/presentation/screen/favorite/state/favorite_ui_state.dart';

class FavoriteNotifier extends Notifier<FavoriteUiState> {
  @override
  FavoriteUiState build() {
    _loadFavorites();
    return const FavoriteUiState.loading();
  }

  Future<void> _loadFavorites() async {
    try {
      final useCase = getIt<GetFavoritesUseCase>();
      final favorites = await useCase();
      state = FavoriteUiState.success(favorites: List.unmodifiable(favorites));
    } catch (e) {
      state = FavoriteUiState.error(e.toString());
    }
  }

  Future<void> toggleFavorite(Product product) async {
    try {
      final isFavUseCase = getIt<IsFavoriteUseCase>();
      final alreadyFav = await isFavUseCase(product.id);

      if (alreadyFav) {
        final removeUseCase = getIt<RemoveFavoriteUseCase>();
        await removeUseCase(product.id);
      } else {
        final addUseCase = getIt<AddFavoriteUseCase>();
        await addUseCase(product);
      }

      await _loadFavorites();
    } catch (_) {}
  }

  Future<void> removeFavorite(int productId) async {
    try {
      final removeUseCase = getIt<RemoveFavoriteUseCase>();
      await removeUseCase(productId);
      await _loadFavorites();
    } catch (_) {}
  }

  Future<void> clearAll() async {
    try {
      final clearUseCase = getIt<ClearFavoritesUseCase>();
      await clearUseCase();
      await _loadFavorites();
    } catch (_) {}
  }

  Future<bool> isFavorite(int productId) async {
    try {
      final isFavUseCase = getIt<IsFavoriteUseCase>();
      return await isFavUseCase(productId);
    } catch (_) {
      return false;
    }
  }
}
