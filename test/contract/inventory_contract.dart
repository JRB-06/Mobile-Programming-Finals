import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/app_exception.dart';
import 'package:los_pollos_hermanos/core/money.dart';
import 'package:los_pollos_hermanos/data/fake/fake_seed.dart';
import 'package:los_pollos_hermanos/models/inventory.dart';
import 'package:los_pollos_hermanos/models/pharmacist.dart';

import 'contract_env.dart';

/// A real file on disk, so no test hands the repository a missing path.
File _tempFile(String name) {
  final dir = Directory.systemTemp.createTempSync('pollos_inventory_');
  return File.fromUri(dir.uri.resolve(name))
    ..writeAsBytesSync([0xFF, 0xD8, 0xFF, 0xE0]);
}

/// InventoryRepository behaviour every adapter must have (Admin only).
void inventoryContract(EnvFactory makeEnv) {
  group('InventoryRepository contract', () {
    test(
      'savePharmacist with a null id creates, with an id updates the same row',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        final created = await env.inventory.savePharmacist(
          const PharmacistInput(
            name: 'Dr. New Hire',
            photoUrl: 'https://example.test/p/new.jpg',
            specialty: 'Eye care',
          ),
        );
        expect(created.id, isNotEmpty);
        expect(created.archived, isFalse);

        final updated = await env.inventory.savePharmacist(
          PharmacistInput(
            id: created.id,
            name: 'Dr. Renamed',
            photoUrl: created.photoUrl,
            specialty: created.specialty,
          ),
        );
        expect(updated.id, created.id);
        final rows = (await env.inventory.pharmacists(includeArchived: true))
            .items
            .where((p) => p.id == created.id);
        expect(rows.map((p) => p.name), ['Dr. Renamed']);
      },
    );

    test(
      'setPharmacistArchived hides the pharmacist from the catalog, and back',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        final id = SeedIds.pharmacistIds.first;
        await env.inventory.setPharmacistArchived(id, true);
        expect(
          (await env.catalog.pharmacists()).items.map((p) => p.id),
          isNot(contains(id)),
        );
        await env.inventory.setPharmacistArchived(id, false);
        expect(
          (await env.catalog.pharmacists()).items.map((p) => p.id),
          contains(id),
        );
      },
    );

    test('pharmacists hides archived ones unless includeArchived', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      // Seed-dependent: the Supabase seed (#19) must match the Fake seed.
      final active = await env.inventory.pharmacists();
      expect(
        active.items.map((p) => p.id),
        unorderedEquals(SeedIds.pharmacistIds),
      );
      final all = await env.inventory.pharmacists(includeArchived: true);
      expect(
        all.items.map((p) => p.id),
        contains(SeedIds.archivedPharmacistId),
      );
    });

    test('products hides archived ones unless includeArchived', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      final visible = await env.inventory.products();
      final ids = visible.items.map((p) => p.id);
      expect(ids, contains(SeedIds.unorderedProductId));
      expect(ids, isNot(contains(SeedIds.archivedProductId)));
      final all = await env.inventory.products(includeArchived: true);
      expect(all.items.map((p) => p.id), contains(SeedIds.archivedProductId));
      expect(
        (await env.inventory.getProduct(SeedIds.archivedProductId)).archived,
        isTrue,
      );
    });

    test(
      'deleteProduct throws HasOrdersException for an ordered product',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        await expectLater(
          env.inventory.deleteProduct(SeedIds.orderedProductId),
          throwsA(isA<HasOrdersException>()),
        );
        expect(
          (await env.inventory.getProduct(SeedIds.orderedProductId)).id,
          SeedIds.orderedProductId,
        );
      },
    );

    test('deleteProduct removes a product nobody ordered', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await env.inventory.deleteProduct(SeedIds.unorderedProductId);
      await expectLater(
        env.inventory.getProduct(SeedIds.unorderedProductId),
        throwsA(isA<AppException>()),
      );
      await expectLater(
        env.catalog.getProduct(SeedIds.unorderedProductId),
        throwsA(isA<AppException>()),
      );
    });

    test('setArchived removes the product from catalog search', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      const query = 'Yarrow Peak Balm';
      expect(
        (await env.catalog.searchProducts(query: query)).items.map((p) => p.id),
        contains(SeedIds.unorderedProductId),
      );
      await env.inventory.setArchived(SeedIds.unorderedProductId, true);
      expect(
        (await env.catalog.searchProducts(query: query)).items.map((p) => p.id),
        isNot(contains(SeedIds.unorderedProductId)),
      );
    });

    test(
      'saveProduct with a null id creates a product the catalog shows',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        final saved = await env.inventory.saveProduct(
          ProductInput(
            pharmacistId: SeedIds.pharmacistIds.first,
            categoryId: SeedIds.categoryId,
            name: 'Test Balm',
            description: 'Fictional.',
            variants: const [
              VariantInput(
                purity: 95.0,
                sizeLabel: '50ml',
                price: Money(20000),
                stock: 8,
              ),
            ],
          ),
        );
        expect(saved.id, isNotEmpty);
        expect(saved.variants.map((v) => v.price), [const Money(20000)]);
        final shown = await env.catalog.getProduct(saved.id);
        expect(shown.name, 'Test Balm');
        expect(shown.minPrice, const Money(20000));
      },
    );

    test('saveProduct updates fields and a variant by id', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      final before = await env.inventory.getProduct(SeedIds.unorderedProductId);
      final v = before.variants.first;
      await env.inventory.saveProduct(
        ProductInput(
          id: SeedIds.unorderedProductId,
          pharmacistId: before.pharmacistId,
          categoryId: before.categoryId,
          name: 'Yarrow Peak Balm Plus',
          description: before.description,
          variants: [
            VariantInput(
              id: v.id,
              purity: v.purity,
              sizeLabel: v.sizeLabel,
              price: v.price,
              stock: 99,
            ),
          ],
        ),
      );
      final after = await env.inventory.getProduct(SeedIds.unorderedProductId);
      expect(after.name, 'Yarrow Peak Balm Plus');
      expect(after.variants, hasLength(before.variants.length));
      expect(after.variants.firstWhere((x) => x.id == v.id).stock, 99);
    });

    test(
      'saveProduct rejects a variant that belongs to another product',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        await expectLater(
          env.inventory.saveProduct(
            ProductInput(
              id: SeedIds.unorderedProductId,
              pharmacistId: SeedIds.pharmacistIds.first,
              name: 'Yarrow Peak Balm',
              variants: const [
                VariantInput(
                  id: SeedIds.variant450Id,
                  purity: 90.0,
                  sizeLabel: '100ml',
                  price: Money(45000),
                  stock: 20,
                ),
              ],
            ),
          ),
          throwsA(isA<AppException>()),
        );
      },
    );

    test('saveProduct rejects an unknown category', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await expectLater(
        env.inventory.saveProduct(
          ProductInput(
            pharmacistId: SeedIds.pharmacistIds.first,
            categoryId: '00000000-0000-4000-8000-00000000dead',
            name: 'Test Balm',
          ),
        ),
        throwsA(isA<UnavailableException>()),
      );
    });

    test(
      'saveProduct records new image files and drops removed ones',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        final front = _tempFile('front.jpg');
        addTearDown(() => front.parent.deleteSync(recursive: true));
        final before = await env.inventory.getProduct(
          SeedIds.unorderedProductId,
        );
        final old = before.images.single;
        final saved = await env.inventory.saveProduct(
          ProductInput(
            id: SeedIds.unorderedProductId,
            pharmacistId: before.pharmacistId,
            name: before.name,
            removedImages: [old],
            newImages: [front],
          ),
        );
        expect(saved.images, hasLength(1));
        expect(saved.images.single, endsWith('front.jpg'));
        expect(saved.images, isNot(contains(old)));
      },
    );

    test('lowStock lists the stock-3 variant, not the stock-30 one', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      final low = await env.inventory.lowStock();
      final ids = low.map((v) => v.variantId);
      expect(ids, contains(SeedIds.variantStock3Id));
      expect(ids, isNot(contains(SeedIds.variantStock30Id)));
      expect(
        low.firstWhere((v) => v.variantId == SeedIds.variantStock3Id).stock,
        3,
      );
    });

    test('lowStock includes stock 5 and excludes stock 6', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      final saved = await env.inventory.saveProduct(
        ProductInput(
          pharmacistId: SeedIds.pharmacistIds.first,
          name: 'Boundary Balm',
          variants: const [
            VariantInput(
              purity: 95.0,
              sizeLabel: '50ml',
              price: Money(10000),
              stock: 5,
            ),
            VariantInput(
              purity: 95.0,
              sizeLabel: '100ml',
              price: Money(10000),
              stock: 6,
            ),
          ],
        ),
      );
      final at5 = saved.variants.singleWhere((v) => v.stock == 5).id;
      final at6 = saved.variants.singleWhere((v) => v.stock == 6).id;
      final ids = (await env.inventory.lowStock()).map((v) => v.variantId);
      expect(ids, contains(at5));
      expect(ids, isNot(contains(at6)));
    });

    test('archived variants are not low stock', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      final p = await env.inventory.getProduct(SeedIds.orderedProductId);
      await env.inventory.saveProduct(
        ProductInput(
          id: p.id,
          pharmacistId: p.pharmacistId,
          categoryId: p.categoryId,
          name: p.name,
          description: p.description,
          variants: const [
            VariantInput(
              id: SeedIds.variantOutOfStockId,
              purity: 60.0,
              sizeLabel: '50ml',
              price: Money(12000),
              stock: 0,
              archived: true,
            ),
          ],
        ),
      );
      final ids = (await env.inventory.lowStock()).map((v) => v.variantId);
      expect(ids, isNot(contains(SeedIds.variantOutOfStockId)));
    });

    test('saveProduct rejects a purity outside 0 to 100', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      for (final purity in [-1.0, 100.5]) {
        await expectLater(
          env.inventory.saveProduct(
            ProductInput(
              pharmacistId: SeedIds.pharmacistIds.first,
              name: 'Bad Purity',
              variants: [
                VariantInput(
                  purity: purity,
                  sizeLabel: '50ml',
                  price: const Money(10000),
                  stock: 1,
                ),
              ],
            ),
          ),
          throwsA(
            isA<ValidationException>().having(
              (e) => e.field,
              'field',
              'purity',
            ),
          ),
        );
      }
    });

    test('saveProduct rejects a price of zero or less', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      for (final centavos in [0, -500]) {
        await expectLater(
          env.inventory.saveProduct(
            ProductInput(
              pharmacistId: SeedIds.pharmacistIds.first,
              name: 'Bad Price',
              variants: [
                VariantInput(
                  purity: 90.0,
                  sizeLabel: '50ml',
                  price: Money(centavos),
                  stock: 1,
                ),
              ],
            ),
          ),
          throwsA(
            isA<ValidationException>().having((e) => e.field, 'field', 'price'),
          ),
        );
      }
    });

    test('saveProduct rejects negative stock', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await expectLater(
        env.inventory.saveProduct(
          ProductInput(
            pharmacistId: SeedIds.pharmacistIds.first,
            name: 'Bad Stock',
            variants: const [
              VariantInput(
                purity: 90.0,
                sizeLabel: '50ml',
                price: Money(10000),
                stock: -1,
              ),
            ],
          ),
        ),
        throwsA(
          isA<ValidationException>().having((e) => e.field, 'field', 'stock'),
        ),
      );
    });

    test(
      'a failed saveProduct saves nothing, not even its valid variants',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.adminEmail);
        final before = await env.inventory.getProduct(
          SeedIds.unorderedProductId,
        );
        await expectLater(
          env.inventory.saveProduct(
            ProductInput(
              id: SeedIds.unorderedProductId,
              pharmacistId: before.pharmacistId,
              name: 'Should Not Save',
              variants: const [
                VariantInput(
                  purity: 90.0,
                  sizeLabel: '250ml',
                  price: Money(30000),
                  stock: 4,
                ),
                VariantInput(
                  purity: 90.0,
                  sizeLabel: '500ml',
                  price: Money(30000),
                  stock: -1,
                ),
              ],
            ),
          ),
          throwsA(
            isA<ValidationException>().having((e) => e.field, 'field', 'stock'),
          ),
        );
        final after = await env.inventory.getProduct(
          SeedIds.unorderedProductId,
        );
        expect(after.name, before.name);
        expect(
          after.variants.map((v) => v.id),
          unorderedEquals(before.variants.map((v) => v.id).toList()),
        );
      },
    );

    test('saveCategory creates, then renames the same id', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      final created = await env.inventory.saveCategory(
        const CategoryInput(name: 'Drops'),
      );
      expect(created.id, isNotEmpty);
      final renamed = await env.inventory.saveCategory(
        CategoryInput(id: created.id, name: 'Eye drops'),
      );
      expect(renamed.id, created.id);
      final names = (await env.catalog.categories())
          .where((c) => c.id == created.id)
          .map((c) => c.name);
      expect(names, ['Eye drops']);
    });

    test('deleteCategory throws InUseException when a product uses it, and deletes an unused one', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.adminEmail);
      await expectLater(
        env.inventory.deleteCategory(SeedIds.categoryId),
        throwsA(isA<InUseException>()),
      );
      await env.inventory.deleteCategory(SeedIds.unusedCategoryId);
      final ids = (await env.catalog.categories()).map((c) => c.id);
      expect(ids, isNot(contains(SeedIds.unusedCategoryId)));
    });

    test(
      'a Customer gets PermissionException from every inventory method',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.customerEmail);
        final pharmacistsBefore = (await env.catalog.pharmacists()).items
            .map((p) => p.id)
            .toList();
        final calls = <String, Future<Object?> Function()>{
          'products': () => env.inventory.products(),
          'pharmacists': () => env.inventory.pharmacists(),
          'getProduct': () =>
              env.inventory.getProduct(SeedIds.unorderedProductId),
          'saveProduct': () => env.inventory.saveProduct(
            ProductInput(pharmacistId: SeedIds.pharmacistIds.first, name: 'x'),
          ),
          'savePharmacist': () => env.inventory.savePharmacist(
            const PharmacistInput(
              name: 'x',
              photoUrl: 'https://example.test/x',
            ),
          ),
          'setPharmacistArchived': () => env.inventory.setPharmacistArchived(
            SeedIds.pharmacistIds.first,
            true,
          ),
          'setArchived': () =>
              env.inventory.setArchived(SeedIds.unorderedProductId, true),
          'deleteProduct': () =>
              env.inventory.deleteProduct(SeedIds.unorderedProductId),
          'lowStock': () => env.inventory.lowStock(),
          'saveCategory': () =>
              env.inventory.saveCategory(const CategoryInput(name: 'x')),
          'deleteCategory': () =>
              env.inventory.deleteCategory(SeedIds.unusedCategoryId),
        };
        for (final e in calls.entries) {
          await expectLater(
            e.value(),
            throwsA(isA<PermissionException>()),
            reason: e.key,
          );
        }
        // The denied calls changed nothing.
        expect(
          (await env.catalog.pharmacists()).items.map((p) => p.id),
          unorderedEquals(pharmacistsBefore),
        );
        expect(
          (await env.catalog.getProduct(SeedIds.unorderedProductId)).id,
          SeedIds.unorderedProductId,
        );
      },
    );
  });
}
