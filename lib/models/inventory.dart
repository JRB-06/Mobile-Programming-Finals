import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:los_pollos_hermanos/core/money.dart';

import 'dart:io';

import 'converters.dart';
import 'product.dart';

part 'inventory.freezed.dart';
part 'inventory.g.dart';

@freezed
abstract class ManagedProduct with _$ManagedProduct {
  const factory ManagedProduct({
    required String id,
    required String pharmacistId,
    String? categoryId,
    required String name,
    @Default('') String description,
    @Default(false) bool archived,
    @Default(<Variant>[]) List<Variant> variants,

    /// Storage paths in display order.
    @Default(<String>[]) List<String> images,
  }) = _ManagedProduct;

  factory ManagedProduct.fromJson(Map<String, dynamic> json) =>
      _$ManagedProductFromJson(json);
}

/// id == null creates a Variant; otherwise updates it.
@freezed
abstract class VariantInput with _$VariantInput {
  const factory VariantInput({
    @JsonKey(includeIfNull: false) String? id,
    required num purity,
    required String sizeLabel,
    @MoneyConverter() required Money price,
    required int stock,
    @Default(false) bool archived,
  }) = _VariantInput;

  factory VariantInput.fromJson(Map<String, dynamic> json) =>
      _$VariantInputFromJson(json);
}

/// Create (id == null) or update; carries new image files, so never serialized.
@freezed
abstract class ProductInput with _$ProductInput {
  const factory ProductInput({
    String? id,
    required String pharmacistId,
    String? categoryId,
    required String name,
    @Default('') String description,
    @Default(<VariantInput>[]) List<VariantInput> variants,
    @Default(<File>[]) List<File> newImages,
    @Default(<String>[]) List<String> removedImages,

    /// Final order of kept image paths.
    @Default(<String>[]) List<String> imageOrder,
  }) = _ProductInput;
}

@freezed
abstract class LowStockVariant with _$LowStockVariant {
  const factory LowStockVariant({
    required String variantId,
    required String productId,
    required String productName,
    required String variantLabel,
    required int stock,
  }) = _LowStockVariant;

  factory LowStockVariant.fromJson(Map<String, dynamic> json) =>
      _$LowStockVariantFromJson(json);
}

/// id == null creates a Category; otherwise updates it.
@freezed
abstract class CategoryInput with _$CategoryInput {
  const factory CategoryInput({
    @JsonKey(includeIfNull: false) String? id,
    required String name,
    String? icon,
  }) = _CategoryInput;

  factory CategoryInput.fromJson(Map<String, dynamic> json) =>
      _$CategoryInputFromJson(json);
}
