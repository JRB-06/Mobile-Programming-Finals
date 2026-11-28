import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/data/fake/fake_seed.dart';
import 'package:los_pollos_hermanos/data/repositories.dart';

/// Every repository, as one adapter set (all Fakes, or all Supabase).
class ContractEnv {
  const ContractEnv({
    required this.auth,
    required this.catalog,
    required this.cart,
    required this.checkout,
    required this.orders,
    required this.account,
    required this.inventory,
    required this.admin,
  });

  final AuthRepository auth;
  final CatalogRepository catalog;
  final CartRepository cart;
  final CheckoutRepository checkout;
  final OrderRepository orders;
  final AccountRepository account;
  final InventoryRepository inventory;
  final AdminRepository admin;

  /// Signs in a seed user (see [SeedIds]) through [auth]. Registers a teardown
  /// that signs out, so no session leaks into the next test.
  Future<void> signInAs(String email) async {
    addTearDown(auth.signOut);
    await auth.signIn(email, SeedIds.password);
  }
}

/// Each test calls this for a fresh, freshly seeded, signed-out environment.
typedef EnvFactory = Future<ContractEnv> Function();
