// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductFilter _$ProductFilterFromJson(Map<String, dynamic> json) =>
    _ProductFilter(
      pharmacistId: json['pharmacist_id'] as String?,
      categoryId: json['category_id'] as String?,
      tier: $enumDecodeNullable(_$TierEnumMap, json['tier']),
      sort:
          $enumDecodeNullable(_$ProductSortEnumMap, json['sort']) ??
          ProductSort.newest,
    );

Map<String, dynamic> _$ProductFilterToJson(_ProductFilter instance) =>
    <String, dynamic>{
      'pharmacist_id': instance.pharmacistId,
      'category_id': instance.categoryId,
      'tier': _$TierEnumMap[instance.tier],
      'sort': _$ProductSortEnumMap[instance.sort]!,
    };

const _$TierEnumMap = {
  Tier.street: 'street',
  Tier.pharma: 'pharma',
  Tier.blueSky: 'blue_sky',
};

const _$ProductSortEnumMap = {
  ProductSort.newest: 'newest',
  ProductSort.priceAsc: 'priceAsc',
  ProductSort.priceDesc: 'priceDesc',
  ProductSort.rating: 'rating',
};

_ProductCard _$ProductCardFromJson(Map<String, dynamic> json) => _ProductCard(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['image_url'] as String?,
  categoryName: json['category_name'] as String?,
  pharmacistId: json['pharmacist_id'] as String,
  pharmacistName: json['pharmacist_name'] as String,
  minPrice: const MoneyConverter().fromJson(json['min_price'] as Object),
  maxPrice: const MoneyConverter().fromJson(json['max_price'] as Object),
  bestTier: $enumDecode(_$TierEnumMap, json['best_tier']),
  inStock: json['in_stock'] as bool,
  rating: (json['rating'] as num?)?.toDouble() ?? 0,
  reviewCount: (json['review_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProductCardToJson(_ProductCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'category_name': instance.categoryName,
      'pharmacist_id': instance.pharmacistId,
      'pharmacist_name': instance.pharmacistName,
      'min_price': const MoneyConverter().toJson(instance.minPrice),
      'max_price': const MoneyConverter().toJson(instance.maxPrice),
      'best_tier': _$TierEnumMap[instance.bestTier]!,
      'in_stock': instance.inStock,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
    };

_Variant _$VariantFromJson(Map<String, dynamic> json) => _Variant(
  id: json['id'] as String,
  productId: json['product_id'] as String,
  purity: json['purity'] as num,
  sizeLabel: json['size_label'] as String,
  price: const MoneyConverter().fromJson(json['price'] as Object),
  stock: (json['stock'] as num).toInt(),
  archived: json['archived'] as bool? ?? false,
);

Map<String, dynamic> _$VariantToJson(_Variant instance) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'purity': instance.purity,
  'size_label': instance.sizeLabel,
  'price': const MoneyConverter().toJson(instance.price),
  'stock': instance.stock,
  'archived': instance.archived,
};

_ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) =>
    _ProductDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
      categoryName: json['category_name'] as String?,
      pharmacistId: json['pharmacist_id'] as String,
      pharmacistName: json['pharmacist_name'] as String,
      minPrice: const MoneyConverter().fromJson(json['min_price'] as Object),
      maxPrice: const MoneyConverter().fromJson(json['max_price'] as Object),
      bestTier: $enumDecode(_$TierEnumMap, json['best_tier']),
      inStock: json['in_stock'] as bool,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      reviewCount: (json['review_count'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      pharmacistPhotoUrl: json['pharmacist_photo_url'] as String,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      variants:
          (json['variants'] as List<dynamic>?)
              ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Variant>[],
    );

Map<String, dynamic> _$ProductDetailToJson(_ProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'category_name': instance.categoryName,
      'pharmacist_id': instance.pharmacistId,
      'pharmacist_name': instance.pharmacistName,
      'min_price': const MoneyConverter().toJson(instance.minPrice),
      'max_price': const MoneyConverter().toJson(instance.maxPrice),
      'best_tier': _$TierEnumMap[instance.bestTier]!,
      'in_stock': instance.inStock,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'description': instance.description,
      'pharmacist_photo_url': instance.pharmacistPhotoUrl,
      'images': instance.images,
      'variants': instance.variants.map((e) => e.toJson()).toList(),
    };
