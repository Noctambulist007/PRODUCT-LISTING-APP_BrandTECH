import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:productify/domain/enum/product/product_sort.dart';
import 'package:productify/domain/model/product/product.dart';

part 'product_ui_state.freezed.dart';

@freezed
class ProductUiState with _$ProductUiState {
  const factory ProductUiState.initial() = InitialState;

  const factory ProductUiState.loading() = LoadingState;

  const factory ProductUiState.success({
    required List<Product> products,
    required List<Product> filtered,
    @Default(ProductSort.none) ProductSort sort,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = SuccessState;

  const factory ProductUiState.error(String message) = ErrorState;
}
