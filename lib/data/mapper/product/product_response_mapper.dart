import 'package:productify/data/datasource/remote/model/response/product/product_response.dart';
import 'package:productify/data/mapper/rating/rating_response_mapper.dart';
import 'package:productify/domain/model/product/product.dart';

extension ProductResponseMapper on ProductResponse {
  Product toDomain() {
    return Product(
      id: id,
      title: title,
      price: price.toDouble(),
      description: description,
      category: category,
      image: image,
      rating: rating.toDomain(),
    );
  }
}
