import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/app_user.dart';
import 'fake/fake_account_repository.dart';
import 'fake/fake_admin_repository.dart';
import 'fake/fake_auth_repository.dart';
import 'fake/fake_cart_repository.dart';
import 'fake/fake_catalog_repository.dart';
import 'fake/fake_checkout_repository.dart';
import 'fake/fake_inventory_repository.dart';
import 'fake/fake_order_repository.dart';
import 'fake/fake_store.dart';
import 'repositories.dart';
import 'supabase/supabase_repositories.dart';

const useFakeData = bool.fromEnvironment('FAKE_DATA');

final useFakeDataProvider = Provider<bool>((ref) => useFakeData);

/// One shared in-memory backend for every Fake.
final fakeStoreProvider = Provider<FakeStore>((ref) {
  final store = FakeStore.seeded();
  ref.onDispose(store.dispose);
  return store;
});

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeAuthRepository(ref.watch(fakeStoreProvider))
      : SupabaseAuthRepository(),
);

final catalogRepositoryProvider = Provider<CatalogRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeCatalogRepository(ref.watch(fakeStoreProvider))
      : SupabaseCatalogRepository(),
);

final cartRepositoryProvider = Provider<CartRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeCartRepository(ref.watch(fakeStoreProvider))
      : SupabaseCartRepository(),
);

final checkoutRepositoryProvider = Provider<CheckoutRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeCheckoutRepository(ref.watch(fakeStoreProvider))
      : SupabaseCheckoutRepository(),
);

final orderRepositoryProvider = Provider<OrderRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeOrderRepository(ref.watch(fakeStoreProvider))
      : SupabaseOrderRepository(),
);

final accountRepositoryProvider = Provider<AccountRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeAccountRepository(ref.watch(fakeStoreProvider))
      : SupabaseAccountRepository(),
);

final inventoryRepositoryProvider = Provider<InventoryRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeInventoryRepository(ref.watch(fakeStoreProvider))
      : SupabaseInventoryRepository(),
);

final adminRepositoryProvider = Provider<AdminRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeAdminRepository(ref.watch(fakeStoreProvider))
      : SupabaseAdminRepository(),
);

final currentUserProvider = StreamProvider<AppUser?>(
  (ref) => ref.watch(authRepositoryProvider).watchUser(),
);

@visibleForTesting
bool isOnline(List<ConnectivityResult> r) =>
    r.any((c) => c != ConnectivityResult.none);

final connectivityProvider = StreamProvider<bool>((_) async* {
  final connectivity = Connectivity();
  yield isOnline(await connectivity.checkConnectivity());
  yield* connectivity.onConnectivityChanged.map(isOnline);
});
