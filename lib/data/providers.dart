import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/app_user.dart';
import 'fake/fake_repositories.dart';
import 'repositories.dart';
import 'supabase/supabase_repositories.dart';

const useFakeData = bool.fromEnvironment('FAKE_DATA');

final useFakeDataProvider = Provider<bool>((ref) => useFakeData);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeAuthRepository()
      : SupabaseAuthRepository(),
);

final catalogRepositoryProvider = Provider<CatalogRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeCatalogRepository()
      : SupabaseCatalogRepository(),
);

final cartRepositoryProvider = Provider<CartRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeCartRepository()
      : SupabaseCartRepository(),
);

final checkoutRepositoryProvider = Provider<CheckoutRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeCheckoutRepository()
      : SupabaseCheckoutRepository(),
);

final orderRepositoryProvider = Provider<OrderRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeOrderRepository()
      : SupabaseOrderRepository(),
);

final accountRepositoryProvider = Provider<AccountRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeAccountRepository()
      : SupabaseAccountRepository(),
);

final inventoryRepositoryProvider = Provider<InventoryRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeInventoryRepository()
      : SupabaseInventoryRepository(),
);

final adminRepositoryProvider = Provider<AdminRepository>(
  (ref) => ref.watch(useFakeDataProvider)
      ? FakeAdminRepository()
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
