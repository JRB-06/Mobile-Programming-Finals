import 'package:los_pollos_hermanos/data/fake/fake_account_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_admin_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_auth_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_cart_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_catalog_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_checkout_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_inventory_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_order_repository.dart';
import 'package:los_pollos_hermanos/data/fake/fake_store.dart';

import 'contract_env.dart';

/// Every Fake over one freshly seeded store, no latency.
Future<ContractEnv> fakeEnv() async {
  final s = FakeStore.seeded(latency: Duration.zero);
  return ContractEnv(
    auth: FakeAuthRepository(s),
    catalog: FakeCatalogRepository(s),
    cart: FakeCartRepository(s),
    checkout: FakeCheckoutRepository(s),
    orders: FakeOrderRepository(s),
    account: FakeAccountRepository(s),
    inventory: FakeInventoryRepository(s),
    admin: FakeAdminRepository(s),
  );
}
