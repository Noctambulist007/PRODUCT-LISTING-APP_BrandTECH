import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/domain/enum/product/product_sort.dart';
import 'package:productify/domain/model/product/product.dart';
import 'package:productify/domain/usecase/product/get_all_products_use_case.dart';
import 'package:productify/domain/util/result.dart';
import 'package:productify/injection_container.dart';
import 'package:productify/presentation/screen/home/state/product_ui_state.dart';

class ProductNotifier extends Notifier<ProductUiState> {
  final List<Product> _allProducts = [];
  String _searchQuery = '';
  String _categoryFilter = '';
  ProductSort _sort = ProductSort.none;
  int _currentLimit = 10;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  @override
  ProductUiState build() {
    _loadInitial();
    return const ProductUiState.loading();
  }

  Future<void> refresh() async {
    _allProducts.clear();
    _currentLimit = 10;
    _hasMore = true;
    _isLoadingMore = false;
    state = const ProductUiState.loading();
    await _fetchProducts();
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;
    _isLoadingMore = true;
    _updateLoadingMore(true);
    _currentLimit += 10;
    await _fetchProducts();
    _isLoadingMore = false;
  }

  void search(String query) {
    _searchQuery = query.toLowerCase().trim();
    _applyFilters();
  }

  void filterByCategory(String category) {
    _categoryFilter = category;
    _applyFilters();
  }

  void sortBy(ProductSort sort) {
    _sort = sort;
    _applyFilters();
  }

  void clearFilters() {
    _searchQuery = '';
    _categoryFilter = '';
    _sort = ProductSort.none;
    _applyFilters();
  }

  Future<void> _loadInitial() async {
    await _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final useCase = getIt<GetAllProductsUseCase>();
    final result = await useCase(page: 1, limit: _currentLimit);

    result.when(
      success: (products) {
        _allProducts.clear();
        _allProducts.addAll(products);

        if (products.isEmpty || products.length < _currentLimit) {
          _hasMore = false;
        } else {
          _hasMore = true;
        }

        state = ProductUiState.success(
          products: List.unmodifiable(_allProducts),
          filtered: _applyFiltersToList(_allProducts),
          hasMore: _hasMore,
          isLoadingMore: false,
          sort: _sort,
        );
      },
      failure: (failure) {
        if (_currentLimit > 10) {
          _currentLimit -= 10;
          _updateLoadingMore(false);
        } else {
          state = ProductUiState.error(failure.message);
        }
      },
    );
  }

  void _applyFilters() {
    if (state is SuccessState) {
      state = (state as SuccessState).copyWith(
        filtered: _applyFiltersToList(_allProducts),
        sort: _sort,
      );
    }
  }

  List<Product> _applyFiltersToList(List<Product> source) {
    final filtered = source.where((p) {
      final matchesSearch =
          _searchQuery.isEmpty ||
          p.title.toLowerCase().contains(_searchQuery) ||
          p.category.toLowerCase().contains(_searchQuery);
      final matchesCategory =
          _categoryFilter.isEmpty ||
          p.category.toLowerCase() == _categoryFilter.toLowerCase();
      return matchesSearch && matchesCategory;
    }).toList();

    return _sortList(filtered);
  }

  List<Product> _sortList(List<Product> list) {
    final sorted = List<Product>.from(list);
    switch (_sort) {
      case ProductSort.none:
        break;
      case ProductSort.priceLowToHigh:
        sorted.sort((a, b) => a.price.compareTo(b.price));
      case ProductSort.priceHighToLow:
        sorted.sort((a, b) => b.price.compareTo(a.price));
      case ProductSort.topRated:
        sorted.sort((a, b) => b.rating.rate.compareTo(a.rating.rate));
      case ProductSort.nameAZ:
        sorted.sort((a, b) => a.title.compareTo(b.title));
      case ProductSort.nameZA:
        sorted.sort((a, b) => b.title.compareTo(a.title));
    }
    return sorted;
  }

  void _updateLoadingMore(bool loading) {
    if (state is SuccessState) {
      state = (state as SuccessState).copyWith(isLoadingMore: loading);
    }
  }
}
