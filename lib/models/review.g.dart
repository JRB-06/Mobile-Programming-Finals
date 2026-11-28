// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  id: json['id'] as String,
  productId: json['product_id'] as String,
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String?,
  reviewerName: json['reviewer_name'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'rating': instance.rating,
  'comment': instance.comment,
  'reviewer_name': instance.reviewerName,
  'created_at': instance.createdAt.toIso8601String(),
};
