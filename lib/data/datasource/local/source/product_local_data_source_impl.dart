import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:productify/data/datasource/local/source/product_local_data_source.dart';
import 'package:productify/data/datasource/remote/model/response/product/product_response.dart';
import 'package:productify/data/datasource/remote/model/response/rating/rating_response.dart';
import 'package:productify/data/mapper/product/product_response_mapper.dart';
import 'package:productify/domain/model/product/product.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final Box _favoritesBox;

  ProductLocalDataSourceImpl({required Box favoritesBox})
    : _favoritesBox = favoritesBox;

  @override
  Future<void> addFavorite(Product product) async {
    final responseDto = ProductResponse(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
      rating: RatingResponse(
        rate: product.rating.rate,
        count: product.rating.count,
      ),
    );
    final jsonString = jsonEncode(responseDto.toJson());
    await _favoritesBox.put(product.id.toString(), jsonString);
  }

  @override
  Future<void> removeFavorite(int productId) async {
    await _favoritesBox.delete(productId.toString());
  }

  @override
  Future<List<Product>> getFavorites() async {
    final List<Product> favorites = [];
    for (var key in _favoritesBox.keys) {
      final jsonString = _favoritesBox.get(key) as String?;
      if (jsonString != null) {
        try {
          final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
          final responseDto = ProductResponse.fromJson(jsonMap);
          favorites.add(responseDto.toDomain());
        // ignore: empty_catches
        } catch (e) {}
      }
    }
    return favorites;
  }

  @override
  Future<bool> isFavorite(int productId) async {
    return _favoritesBox.containsKey(productId.toString());
  }

  @override
  Future<void> clearAllFavorites() async {
    await _favoritesBox.clear();
  }
}
