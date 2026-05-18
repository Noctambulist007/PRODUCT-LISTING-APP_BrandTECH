import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:productify/domain/model/product/product.dart';

part 'product_ui_state.freezed.dart';

@freezed
class ProductUiState with _$ProductUiState {
  const factory ProductUiState.initial() = InitialState;

  const factory ProductUiState.loading() = LoadingState;

  const factory ProductUiState.success({required List<Product> products, @Default(true) bool hasMore}) = SuccessState;


  const factory ProductUiState.error(String message) = ErrorState;
}
