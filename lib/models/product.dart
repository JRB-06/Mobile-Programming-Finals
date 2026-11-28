import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/core/tier.dart';

import 'converters.dart';

part 'product.freezed.dart';
part 'product.g.dart';

enum ProductSort { newest, priceAsc, priceDesc, rating }

@freezed
abstract class ProductFilter with _$ProductFilter {
  const factory ProductFilter({
    String? pharmacistId,
    String? categoryId,
    Tier? tier,
    @Default(ProductSort.newest) ProductSort sort,
  }) = _ProductFilter;

  factory ProductFilter.fromJson(Map<String, dynamic> json) =>
      _$ProductFilterFromJson(json);
}

// Mirrors the `product_cards` view columns.
@freezed
abstract class ProductCard with _$ProductCard {
  const factory ProductCard({
    required String id,
    required String name,
    String? imageUrl,
    String? categoryName,
    required String pharmacistId,
    required String pharmacistName,
    @MoneyConverter() required Money minPrice,
    @MoneyConverter() required Money maxPrice,
    required Tier bestTier,
    required bool inStock,
    @Default(0) double rating,
    @Default(0) int reviewCount,
  }) = _ProductCard;

  factory ProductCard.fromJson(Map<String, dynamic> json) =>
      _$ProductCardFromJson(json);
}

@freezed
abstract class Variant with _$Variant {
  const Variant._();

  const factory Variant({
    required String id,
    required String productId,
    required num purity,
    required String sizeLabel,
    @MoneyConverter() required Money price,
    required int stock,
    @Default(false) bool archived,
  }) = _Variant;

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Tier get tier => Tier.fromPurity(purity);

  /// e.g. "99.1% · 100ml"
  String get label => '${purity.toStringAsFixed(1)}% · $sizeLabel';
}

/// The ProductCard fields plus description, pharmacist photo, images, Variants.
@freezed
abstract class ProductDetail with _$ProductDetail {
  const factory ProductDetail({
    required String id,
    required String name,
    String? imageUrl,
    String? categoryName,
    required String pharmacistId,
    required String pharmacistName,
    @MoneyConverter() required Money minPrice,
    @MoneyConverter() required Money maxPrice,
    required Tier bestTier,
    required bool inStock,
    @Default(0) double rating,
    @Default(0) int reviewCount,
    @Default('') String description,
    required String pharmacistPhotoUrl,
    @Default(<String>[]) List<String> images,
    @Default(<Variant>[]) List<Variant> variants,
  }) = _ProductDetail;

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);
}
