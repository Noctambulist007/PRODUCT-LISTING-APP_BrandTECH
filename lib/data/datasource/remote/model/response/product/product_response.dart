import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:productify/data/datasource/remote/model/response/rating/rating_response.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
abstract class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required RatingResponse rating,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}
