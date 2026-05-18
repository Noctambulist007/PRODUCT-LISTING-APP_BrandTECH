import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:productify/domain/model/product/product.dart';

part 'favorite_ui_state.freezed.dart';

@freezed
class FavoriteUiState with _$FavoriteUiState {
  const factory FavoriteUiState.initial() = InitialState;

  const factory FavoriteUiState.loading() = LoadingState;

  const factory FavoriteUiState.success({required List<Product> favorites}) =
      SuccessState;

  const factory FavoriteUiState.error(String message) = ErrorState;
}
