// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingResponse _$RatingResponseFromJson(Map<String, dynamic> json) =>
    _RatingResponse(
      rate: (json['rate'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$RatingResponseToJson(_RatingResponse instance) =>
    <String, dynamic>{'rate': instance.rate, 'count': instance.count};
