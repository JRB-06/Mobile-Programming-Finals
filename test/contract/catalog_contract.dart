import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/app_exception.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/core/tier.dart';
import 'package:los_pollos_hermanos/data/fake/fake_seed.dart';
import 'package:los_pollos_hermanos/data/repositories.dart';
import 'package:los_pollos_hermanos/models/page.dart';
import 'package:los_pollos_hermanos/models/product.dart';

import 'contract_env.dart';

Future<List<ProductCard>> _allProducts(
  CatalogRepository catalog, {
  String query = '',
  ProductFilter filter = const ProductFilter(),
}) async {
  final all = <ProductCard>[];
  Page<ProductCard> page;
  var n = 0;
  do {
    page = await catalog.searchProducts(
      query: query,
      filter: filter,
      page: n++,
    );
    all.addAll(page.items);
  } while (page.hasMore);
  return all;
}

/// A catalog read needs a signed-in user.
Future<CatalogRepository> _catalog(EnvFactory makeEnv) async {
  final env = await makeEnv();
  await env.signInAs(SeedIds.customerEmail);
  return env.catalog;
}

/// CatalogRepository behaviour every adapter must have.
void catalogContract(EnvFactory makeEnv) {
  group('CatalogRepository contract', () {
    test('signed out, catalog calls throw an AppException', () async {
      final c = (await makeEnv()).catalog;
      expect(c.pharmacists(), throwsA(isA<AppException>()));
      expect(c.searchProducts(), throwsA(isA<AppException>()));
      expect(c.categories(), throwsA(isA<AppException>()));
      expect(
        c.getProduct(SeedIds.orderedProductId),
        throwsA(isA<AppException>()),
      );
    });

    test('pharmacists lists only non-archived pharmacists', () async {
      final c = await _catalog(makeEnv);
      final page = await c.pharmacists();
      expect(
        page.items.map((p) => p.id),
        unorderedEquals(SeedIds.pharmacistIds),
      );
      expect(page.items.every((p) => !p.archived), isTrue);
      expect(page.hasMore, isFalse);
    });

    test(
      'pharmacists query matches name or specialty, case-insensitively',
      () async {
        final c = await _catalog(makeEnv);
        final first = (await c.pharmacists()).items.first;
        final byName = await c.pharmacists(query: first.name.toUpperCase());
        expect(byName.items.map((p) => p.id), [first.id]);
        final bySpecialty = await c.pharmacists(
          query: first.specialty!.toLowerCase(),
        );
        expect(bySpecialty.items.map((p) => p.id), contains(first.id));
        expect((await c.pharmacists(query: 'zzzz-no-match')).items, isEmpty);
      },
    );

    test(
      'filter by pharmacistId returns only that pharmacist\'s products',
      () async {
        final c = await _catalog(makeEnv);
        final cards = await _allProducts(
          c,
          filter: const ProductFilter(pharmacistId: SeedIds.pharmacistId),
        );
        expect(cards, isNotEmpty);
        expect(
          cards.every((p) => p.pharmacistId == SeedIds.pharmacistId),
          isTrue,
        );
        expect(cards.length, lessThan(SeedIds.visibleProductCount));
      },
    );

    test('query is a case-insensitive name match and never returns archived products', () async {
      final c = await _catalog(makeEnv);
      final lower = await _allProducts(c, query: 'blue');
      final upper = await _allProducts(c, query: 'BLUE');
      expect(lower, isNotEmpty);
      expect(upper.map((p) => p.id), lower.map((p) => p.id));
      expect(lower.every((p) => p.name.toLowerCase().contains('blue')), isTrue);
      final ids = lower.map((p) => p.id);
      expect(ids, isNot(contains(SeedIds.archivedProductId)));
      expect(ids, isNot(contains(SeedIds.archivedPharmacistProductId)));
    });

    test('tier filter blueSky returns exactly the products with a live blueSky variant', () async {
      final c = await _catalog(makeEnv);
      final all = await _allProducts(c);
      final expected = <String>{};
      for (final card in all) {
        final detail = await c.getProduct(card.id);
        if (detail.variants.any((v) => v.purity >= 99)) expected.add(card.id);
      }
      final got = await _allProducts(
        c,
        filter: const ProductFilter(tier: Tier.blueSky),
      );
      expect(expected, isNotEmpty);
      expect(got.map((p) => p.id).toSet(), expected);
      expect(got.every((p) => p.bestTier == Tier.blueSky), isTrue);
      expect(
        got.map((p) => p.id),
        isNot(contains(SeedIds.archivedBlueVariantProductId)),
      );
    });

    test('category filter', () async {
      final c = await _catalog(makeEnv);
      expect(
        await _allProducts(
          c,
          filter: const ProductFilter(categoryId: SeedIds.categoryId),
        ),
        isNotEmpty,
      );
      expect(
        await _allProducts(
          c,
          filter: const ProductFilter(categoryId: SeedIds.unusedCategoryId),
        ),
        isEmpty,
      );
      expect(
        (await c.categories()).map((x) => x.id),
        contains(SeedIds.unusedCategoryId),
      );
    });

    test('paging: 20 with hasMore, then the remaining 5', () async {
      final c = await _catalog(makeEnv);
      final first = await c.searchProducts();
      expect(first.items, hasLength(20));
      expect(first.hasMore, isTrue);
      final second = await c.searchProducts(page: 1);
      expect(second.items, hasLength(SeedIds.visibleProductCount - 20));
      expect(second.hasMore, isFalse);
      expect(
        {...first.items, ...second.items}.length,
        SeedIds.visibleProductCount,
      );
    });

    test('sort priceAsc and rating', () async {
      final c = await _catalog(makeEnv);
      final asc = await _allProducts(
        c,
        filter: const ProductFilter(sort: ProductSort.priceAsc),
      );
      for (var i = 1; i < asc.length; i++) {
        expect(
          asc[i - 1].minPrice.compareTo(asc[i].minPrice),
          lessThanOrEqualTo(0),
        );
      }
      final byRating = await _allProducts(
        c,
        filter: const ProductFilter(sort: ProductSort.rating),
      );
      expect(byRating.first.id, SeedIds.reviewedProductId);
    });

    test('archived pharmacist and archived product never appear', () async {
      final c = await _catalog(makeEnv);
      final ids = (await _allProducts(c)).map((p) => p.id);
      expect(ids, isNot(contains(SeedIds.archivedPharmacistProductId)));
      expect(ids, isNot(contains(SeedIds.archivedProductId)));
      expect(
        await _allProducts(
          c,
          filter: const ProductFilter(
            pharmacistId: SeedIds.archivedPharmacistId,
          ),
        ),
        isEmpty,
      );
      expect(ids, isNot(contains(SeedIds.allVariantsArchivedProductId)));
      for (final id in [
        SeedIds.archivedPharmacistProductId,
        SeedIds.archivedProductId,
        SeedIds.allVariantsArchivedProductId,
      ]) {
        expect(c.getProduct(id), throwsA(isA<AppException>()));
        expect(c.productReviews(id), throwsA(isA<AppException>()));
      }
    });

    test(
      'ProductCard and ProductDetail are computed from live variants',
      () async {
        final c = await _catalog(makeEnv);
        final card = (await _allProducts(c))
            .firstWhere((p) => p.id == SeedIds.orderedProductId);
        expect(card.minPrice, const Money(12000));
        expect(card.maxPrice, const Money(45000));
        expect(card.inStock, isTrue);
        final detail = await c.getProduct(SeedIds.orderedProductId);
        expect(
          detail.variants.map((v) => v.id),
          unorderedEquals([SeedIds.variant450Id, SeedIds.variantOutOfStockId]),
        );
        final four = await c.getProduct(SeedIds.archivedBlueVariantProductId);
        expect(four.variants.every((v) => !v.archived), isTrue);
        expect(four.bestTier, Tier.pharma);
      },
    );

    test('ratings come from reviews', () async {
      final c = await _catalog(makeEnv);
      final detail = await c.getProduct(SeedIds.reviewedProductId);
      expect(detail.reviewCount, 1);
      expect(detail.rating, 5);
      final reviews = await c.productReviews(SeedIds.reviewedProductId);
      expect(reviews.items, hasLength(1));
      expect(reviews.items.single.rating, 5);
    });
  });
}
