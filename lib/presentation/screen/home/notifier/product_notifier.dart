import 'package:flutter_riverpod/legacy.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/usecase/product/get_all_products_use_case.dart';
import 'package:productify/domain/util/result.dart';
import 'package:productify/injection_container.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';

class ProductNotifier extends StateNotifier<ProductUiState> {
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  List<Product> _allProducts = [];

  ProductNotifier() : super(const ProductUiState.loading()) {
    getProducts();
  }

  Future<void> getProducts({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
      _allProducts = [];
    }

    state = const ProductUiState.loading();

    final useCase = getIt<GetAllProductsUseCase>();
    final result = await useCase(page: _currentPage, limit: 10);

    state = result.when(
      success: (products) {
        _allProducts = products;
        _hasMore = products.length >= 10;
        return ProductUiState.success(
          products: _allProducts,
          hasMore: _hasMore,
        );
      },
      failure: (failure) {
        return ProductUiState.error(failure.message);
      },
    );
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    _currentPage++;

    final useCase = getIt<GetAllProductsUseCase>();
    final result = await useCase(page: _currentPage, limit: 10);

    result.when(
      success: (products) {
        if (products.isEmpty || products.length < 10) {
          _hasMore = false;
        }
        _allProducts.addAll(products);
        state = ProductUiState.success(
          products: _allProducts,
          hasMore: _hasMore,
        );
      },
      failure: (failure) {
        _currentPage--;
      },
    );

    _isLoadingMore = false;
  }
}
