import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/data/fake/fake_account_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_admin_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_auth_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_cart_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_catalog_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_checkout_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_inventory_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_order_repository.dart';
import 'package:los_pollos_hermanos/data/providers.dart';
import 'package:los_pollos_hermanos/data/repositories.dart';
import 'package:los_pollos_hermanos/data/supabase/supabase_repositories.dart';
import 'package:los_pollos_hermanos/models/app_user.dart';

class StubAuthRepository implements AuthRepository {
  @override
  Stream<AppUser?> watchUser() => Stream.value(null);

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

typedef _Case = ({
  String name,
  Object Function(ProviderContainer) read,
  Type fake,
  Type supabase,
});

final _cases = <_Case>[
  (
    name: 'auth',
    read: (c) => c.read(authRepositoryProvider),
    fake: FakeAuthRepository,
    supabase: SupabaseAuthRepository,
  ),
  (
    name: 'catalog',
    read: (c) => c.read(catalogRepositoryProvider),
    fake: FakeCatalogRepository,
    supabase: SupabaseCatalogRepository,
  ),
  (
    name: 'cart',
    read: (c) => c.read(cartRepositoryProvider),
    fake: FakeCartRepository,
    supabase: SupabaseCartRepository,
  ),
  (
    name: 'checkout',
    read: (c) => c.read(checkoutRepositoryProvider),
    fake: FakeCheckoutRepository,
    supabase: SupabaseCheckoutRepository,
  ),
  (
    name: 'order',
    read: (c) => c.read(orderRepositoryProvider),
    fake: FakeOrderRepository,
    supabase: SupabaseOrderRepository,
  ),
  (
    name: 'account',
    read: (c) => c.read(accountRepositoryProvider),
    fake: FakeAccountRepository,
    supabase: SupabaseAccountRepository,
  ),
  (
    name: 'inventory',
    read: (c) => c.read(inventoryRepositoryProvider),
    fake: FakeInventoryRepository,
    supabase: SupabaseInventoryRepository,
  ),
  (
    name: 'admin',
    read: (c) => c.read(adminRepositoryProvider),
    fake: FakeAdminRepository,
    supabase: SupabaseAdminRepository,
  ),
];

ProviderContainer container([bool? fake]) {
  final c = ProviderContainer(
    overrides: [if (fake != null) useFakeDataProvider.overrideWithValue(fake)],
  );
  addTearDown(c.dispose);
  return c;
}

void main() {
  group('repository providers', () {
    test('useFakeData true selects every Fake', () {
      final c = container(true);
      for (final k in _cases) {
        expect(k.read(c).runtimeType, k.fake, reason: k.name);
      }
    });

    test('useFakeData false selects every Supabase adapter', () {
      final c = container(false);
      for (final k in _cases) {
        expect(k.read(c).runtimeType, k.supabase, reason: k.name);
      }
    });

    test('without an override the default follows the FAKE_DATA define', () {
      final c = container();
      for (final k in _cases) {
        expect(
          k.read(c).runtimeType,
          useFakeData ? k.fake : k.supabase,
          reason: k.name,
        );
      }
    });
  });

  test('currentUserProvider emits what watchUser emits', () async {
    final c = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(StubAuthRepository()),
      ],
    );
    addTearDown(c.dispose);
    // StreamProvider is not autoDispose, but with no listener Riverpod 3 disposes it while
    // its first value is still pending, which fails the .future. One listener keeps it alive.
    final sub = c.listen(currentUserProvider, (_, _) {});
    addTearDown(sub.close);
    expect(await c.read(currentUserProvider.future), isNull);
  });

  group('isOnline', () {
    test('only none is offline', () {
      expect(isOnline([ConnectivityResult.none]), isFalse);
    });

    test('wifi is online', () {
      expect(isOnline([ConnectivityResult.wifi]), isTrue);
    });

    test('none plus mobile is online', () {
      expect(
        isOnline([ConnectivityResult.none, ConnectivityResult.mobile]),
        isTrue,
      );
    });

    test('an empty list is offline', () {
      expect(isOnline([]), isFalse);
    });
  });
}
