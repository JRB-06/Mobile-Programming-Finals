import '../../core/app_exception.dart';
import '../../core/money.dart';
import '../../core/tier.dart';
import '../../models/category.dart';
import '../../models/inventory.dart';
import '../../models/page.dart';
import '../../models/pharmacist.dart';
import '../../models/product.dart';
import '../../models/review.dart';
import '../repositories.dart';
import 'fake_store.dart';

/// Behaviour notes:
/// - Every method needs a signed-in user ([PermissionException] otherwise).
/// - Never returns archived pharmacists, products or variants, nor products of
///   an archived pharmacist, nor products with no live variant.
/// - [getProduct] and [productReviews] of any such product throw
///   [UnavailableException] carrying the product id.
/// - Variants of a product come back by purity, highest first.
/// - `priceAsc`/`priceDesc` sort by minPrice; `rating` by rating then
///   reviewCount; `newest` is last-inserted first. Ties keep newest first.
class FakeCatalogRepository implements CatalogRepository {
  FakeCatalogRepository(this.store);

  final FakeStore store;

  @override
  Future<Page<Pharmacist>> pharmacists({
    String query = '',
    int page = 0,
  }) async {
    await store.delay();
    store.requireUser();
    final q = query.trim().toLowerCase();
    return paginate([
      for (final p in store.pharmacists.values)
        if (!p.archived &&
            (p.name.toLowerCase().contains(q) ||
                (p.specialty ?? '').toLowerCase().contains(q)))
          p,
    ], page);
  }

  @override
  Future<Page<ProductCard>> searchProducts({
    String query = '',
    ProductFilter filter = const ProductFilter(),
    int page = 0,
  }) async {
    await store.delay();
    store.requireUser();
    final q = query.trim().toLowerCase();
    final cards = [
      for (final p in _visible())
        if (p.name.toLowerCase().contains(q) &&
            (filter.pharmacistId == null ||
                p.pharmacistId == filter.pharmacistId) &&
            (filter.categoryId == null || p.categoryId == filter.categoryId) &&
            (filter.tier == null ||
                _live(p.id).any((v) => v.tier == filter.tier)))
          _card(p),
    ];
    final newestFirst = {for (var i = 0; i < cards.length; i++) cards[i].id: i};
    int tie(int c, ProductCard a, ProductCard b) =>
        c != 0 ? c : newestFirst[a.id]! - newestFirst[b.id]!;
    switch (filter.sort) {
      case ProductSort.newest:
        break;
      case ProductSort.priceAsc:
        cards.sort((a, b) => tie(a.minPrice.compareTo(b.minPrice), a, b));
      case ProductSort.priceDesc:
        cards.sort((a, b) => tie(b.minPrice.compareTo(a.minPrice), a, b));
      case ProductSort.rating:
        cards.sort(
          (a, b) => tie(
            b.rating != a.rating
                ? b.rating.compareTo(a.rating)
                : b.reviewCount.compareTo(a.reviewCount),
            a,
            b,
          ),
        );
    }
    return paginate(cards, page);
  }

  @override
  Future<ProductDetail> getProduct(String productId) async {
    await store.delay();
    store.requireUser();
    final p = _visibleProduct(productId);
    final c = _card(p);
    final variants = _live(p.id)..sort((a, b) => b.purity.compareTo(a.purity));
    return ProductDetail(
      id: c.id,
      name: c.name,
      imageUrl: c.imageUrl,
      categoryName: c.categoryName,
      pharmacistId: c.pharmacistId,
      pharmacistName: c.pharmacistName,
      minPrice: c.minPrice,
      maxPrice: c.maxPrice,
      bestTier: c.bestTier,
      inStock: c.inStock,
      rating: c.rating,
      reviewCount: c.reviewCount,
      description: p.description,
      pharmacistPhotoUrl: store.pharmacists[p.pharmacistId]!.photoUrl,
      images: p.images,
      variants: variants,
    );
  }

  @override
  Future<Page<Review>> productReviews(String productId, {int page = 0}) async {
    await store.delay();
    store.requireUser();
    _visibleProduct(productId);
    final all = _reviews(productId)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return paginate(all, page);
  }

  @override
  Future<List<Category>> categories() async {
    await store.delay();
    store.requireUser();
    return store.categories.values.toList();
  }

  List<Variant> _live(String productId) => [
    for (final v in store.variants.values)
      if (v.productId == productId && !v.archived) v,
  ];

  List<Review> _reviews(String productId) => [
    for (final r in store.reviews)
      if (r.review.productId == productId) r.review,
  ];

  bool _isVisible(ManagedProduct p) =>
      !p.archived &&
      store.pharmacists[p.pharmacistId]?.archived == false &&
      _live(p.id).isNotEmpty;

  /// Visible products, newest first.
  Iterable<ManagedProduct> _visible() =>
      store.products.values.toList().reversed.where(_isVisible);

  ManagedProduct _visibleProduct(String id) {
    final p = store.products[id];
    if (p == null || !_isVisible(p)) throw UnavailableException(id);
    return p;
  }

  ProductCard _card(ManagedProduct p) {
    final vs = _live(p.id);
    final reviews = _reviews(p.id);
    Money pick(Money a, Money b, bool min) =>
        (a.compareTo(b) <= 0) == min ? a : b;
    return ProductCard(
      id: p.id,
      name: p.name,
      imageUrl: p.images.firstOrNull,
      categoryName: store.categories[p.categoryId]?.name,
      pharmacistId: p.pharmacistId,
      pharmacistName: store.pharmacists[p.pharmacistId]!.name,
      minPrice: vs.map((v) => v.price).reduce((a, b) => pick(a, b, true)),
      maxPrice: vs.map((v) => v.price).reduce((a, b) => pick(a, b, false)),
      bestTier: Tier.fromPurity(
        vs.map((v) => v.purity).reduce((a, b) => a >= b ? a : b),
      ),
      inStock: vs.any((v) => v.stock > 0),
      rating: reviews.isEmpty
          ? 0
          : reviews.fold(0, (n, r) => n + r.rating) / reviews.length,
      reviewCount: reviews.length,
    );
  }
}
