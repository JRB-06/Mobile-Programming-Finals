// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagedProduct _$ManagedProductFromJson(Map<String, dynamic> json) =>
    _ManagedProduct(
      id: json['id'] as String,
      pharmacistId: json['pharmacist_id'] as String,
      categoryId: json['category_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      archived: json['archived'] as bool? ?? false,
      variants:
          (json['variants'] as List<dynamic>?)
              ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Variant>[],
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$ManagedProductToJson(_ManagedProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pharmacist_id': instance.pharmacistId,
      'category_id': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'archived': instance.archived,
      'variants': instance.variants.map((e) => e.toJson()).toList(),
      'images': instance.images,
    };

_VariantInput _$VariantInputFromJson(Map<String, dynamic> json) =>
    _VariantInput(
      id: json['id'] as String?,
      purity: json['purity'] as num,
      sizeLabel: json['size_label'] as String,
      price: const MoneyConverter().fromJson(json['price'] as Object),
      stock: (json['stock'] as num).toInt(),
      archived: json['archived'] as bool? ?? false,
    );

Map<String, dynamic> _$VariantInputToJson(_VariantInput instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'purity': instance.purity,
      'size_label': instance.sizeLabel,
      'price': const MoneyConverter().toJson(instance.price),
      'stock': instance.stock,
      'archived': instance.archived,
    };

_LowStockVariant _$LowStockVariantFromJson(Map<String, dynamic> json) =>
    _LowStockVariant(
      variantId: json['variant_id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      variantLabel: json['variant_label'] as String,
      stock: (json['stock'] as num).toInt(),
    );

Map<String, dynamic> _$LowStockVariantToJson(_LowStockVariant instance) =>
    <String, dynamic>{
      'variant_id': instance.variantId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'variant_label': instance.variantLabel,
      'stock': instance.stock,
    };

_CategoryInput _$CategoryInputFromJson(Map<String, dynamic> json) =>
    _CategoryInput(
      id: json['id'] as String?,
      name: json['name'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$CategoryInputToJson(_CategoryInput instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
