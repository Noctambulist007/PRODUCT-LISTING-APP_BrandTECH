import 'package:productify/data/datasource/remote/model/response/rating/rating_response.dart';
import 'package:productify/domain/model/rating/rating.dart';

extension RatingResponseMapper on RatingResponse {
  Rating toDomain() {
    return Rating(rate: rate, count: count);
  }
}
