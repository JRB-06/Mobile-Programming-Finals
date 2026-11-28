import 'package:uuid/uuid.dart';

import '../../core/app_exception.dart';
import '../../models/category.dart';
import '../../models/inventory.dart';
import '../../models/page.dart';
import '../../models/pharmacist.dart';
import '../../models/product.dart';
import '../repositories.dart';
import 'fake_store.dart';

/// Low stock means a live (non-archived) Variant with stock at or below this.
const lowStockLimit = 5;

bool isLowStock(Variant v) => !v.archived && v.stock <= lowStockLimit;

/// Behaviour notes:
/// - Every method needs the Admin.
/// - Archived rows come back only when asked for ([includeArchived]), except
///   [getProduct], which returns any product.
/// - An id that does not exist throws [UnavailableException] carrying it.
/// - Images are recorded as `products/<productId>/<file name>`; no bytes stored.
/// - Deleting a Product also removes its Variants and their Cart lines.
class FakeInventoryRepository implements InventoryRepository {
  FakeInventoryRepository(this.store);

  final FakeStore store;

  @override
  Future<Page<Pharmacist>> pharmacists({
    String query = '',
    bool includeArchived = false,
    int page = 0,
  }) async {
    await store.delay();
    store.requireAdmin();
    final q = query.trim().toLowerCase();
    return paginate([
      for (final p in store.pharmacists.values)
        if ((includeArchived || !p.archived) &&
            (p.name.toLowerCase().contains(q) ||
                (p.specialty ?? '').toLowerCase().contains(q)))
          p,
    ], page);
  }

  @override
  Future<Pharmacist> savePharmacist(PharmacistInput p) async {
    await store.delay();
    store.requireAdmin();
    final id = p.id ?? const Uuid().v4();
    final old = store.pharmacists[id];
    if (p.id != null && old == null) throw UnavailableException(id);
    final saved = Pharmacist(
      id: id,
      name: p.name,
      photoUrl: p.photoUrl,
      specialty: p.specialty,
      archived: old?.archived ?? false,
    );
    store.pharmacists[id] = saved;
    store.notify();
    return saved;
  }

  @override
  Future<void> setPharmacistArchived(String pharmacistId, bool archived) async {
    await store.delay();
    store.requireAdmin();
    final old = store.pharmacists[pharmacistId];
    if (old == null) throw UnavailableException(pharmacistId);
    store.pharmacists[pharmacistId] = old.copyWith(archived: archived);
    store.notify();
  }

  @override
  Future<Page<ManagedProduct>> products({
    String query = '',
    bool includeArchived = false,
    int page = 0,
  }) async {
    await store.delay();
    store.requireAdmin();
    final q = query.trim().toLowerCase();
    return paginate([
      for (final p in store.products.values.toList().reversed)
        if ((includeArchived || !p.archived) &&
            p.name.toLowerCase().contains(q))
          _managed(p),
    ], page);
  }

  @override
  Future<ManagedProduct> getProduct(String productId) async {
    await store.delay();
    store.requireAdmin();
    return _managed(_product(productId));
  }

  @override
  Future<ManagedProduct> saveProduct(ProductInput input) async {
    await store.delay();
    store.requireAdmin();
    final id = input.id ?? const Uuid().v4();
    final old = input.id == null ? null : _product(id);
    if (store.pharmacists[input.pharmacistId] == null) {
      throw UnavailableException(input.pharmacistId);
    }
    for (final v in input.variants) {
      final vid = v.id;
      if (vid != null && store.variants[vid]?.productId != id) {
        throw UnavailableException(vid);
      }
    }

    for (final v in input.variants) {
      if (v.purity < 0 || v.purity > 100) {
        throw const ValidationException(
          'purity',
          'Purity must be between 0 and 100',
        );
      }
      if (v.price.centavos <= 0) {
        throw const ValidationException(
          'price',
          'Price must be more than zero',
        );
      }
      if (v.stock < 0) {
        throw const ValidationException('stock', 'Stock cannot be negative');
      }
    }
    final cid = input.categoryId;
    if (cid != null && !store.categories.containsKey(cid)) {
      throw UnavailableException(cid);
    }
    final kept = [
      for (final path in old?.images ?? const <String>[])
        if (!input.removedImages.contains(path)) path,
    ];
    final added = [
      for (final f in input.newImages)
        'products/$id/${f.path.split(RegExp(r'[\\/]')).last}',
    ];
    final all = [...kept, ...added];
    final images = [
      ...input.imageOrder.where(all.contains),
      ...all.where((path) => !input.imageOrder.contains(path)),
    ];

    for (final v in input.variants) {
      final vid = v.id ?? const Uuid().v4();
      store.variants[vid] = Variant(
        id: vid,
        productId: id,
        purity: v.purity,
        sizeLabel: v.sizeLabel,
        price: v.price,
        stock: v.stock,
        archived: v.archived,
      );
    }
    store.products[id] = ManagedProduct(
      id: id,
      pharmacistId: input.pharmacistId,
      categoryId: input.categoryId,
      name: input.name,
      description: input.description,
      archived: old?.archived ?? false,
      images: images,
    );
    store.notify();
    return _managed(store.products[id]!);
  }

  @override
  Future<void> setArchived(String productId, bool archived) async {
    await store.delay();
    store.requireAdmin();
    store.products[productId] = _product(productId)
        .copyWith(archived: archived);
    store.notify();
  }

  @override
  Future<void> deleteProduct(String productId) async {
    await store.delay();
    store.requireAdmin();
    _product(productId);
    if (store.orderItems.values.any((i) => i.productId == productId)) {
      throw const HasOrdersException();
    }
    final variantIds = [
      for (final v in store.variants.values)
        if (v.productId == productId) v.id,
    ];
    store.products.remove(productId);
    store.variants.removeWhere((_, v) => v.productId == productId);
    store.cartLines.removeWhere((vid, _) => variantIds.contains(vid));
    store.notify();
  }

  @override
  Future<List<LowStockVariant>> lowStock() async {
    await store.delay();
    store.requireAdmin();
    return [
      for (final v in store.variants.values)
        if (isLowStock(v))
          LowStockVariant(
            variantId: v.id,
            productId: v.productId,
            productName: store.products[v.productId]!.name,
            variantLabel: v.label,
            stock: v.stock,
          ),
    ];
  }

  @override
  Future<Category> saveCategory(CategoryInput c) async {
    await store.delay();
    store.requireAdmin();
    final id = c.id ?? const Uuid().v4();
    if (c.id != null && !store.categories.containsKey(id)) {
      throw UnavailableException(id);
    }
    final saved = Category(id: id, name: c.name, icon: c.icon);
    store.categories[id] = saved;
    store.notify();
    return saved;
  }

  @override
  Future<void> deleteCategory(String id) async {
    await store.delay();
    store.requireAdmin();
    if (store.products.values.any((p) => p.categoryId == id)) {
      throw const InUseException();
    }
    store.categories.remove(id);
    store.notify();
  }

  ManagedProduct _product(String id) =>
      store.products[id] ?? (throw UnavailableException(id));

  /// The stored Product with its Variants, archived ones included.
  ManagedProduct _managed(ManagedProduct p) => p.copyWith(
    variants: [
      for (final v in store.variants.values)
        if (v.productId == p.id) v,
    ],
  );
}
