import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_response.freezed.dart';

part 'rating_response.g.dart';

@freezed
abstract class RatingResponse with _$RatingResponse {
  const factory RatingResponse({required double rate, required int count}) =
      _RatingResponse;

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);
}
