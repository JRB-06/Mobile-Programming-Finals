// shortcut: stubs until issue #7 (fakes) / #9+ (Supabase) fill them in.
import '../repositories.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('FakeAuthRepository: issue #7');
}

class FakeCatalogRepository implements CatalogRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('FakeCatalogRepository: issue #7');
}

class FakeCartRepository implements CartRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('FakeCartRepository: issue #7');
}

class FakeCheckoutRepository implements CheckoutRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('FakeCheckoutRepository: issue #7');
}

class FakeOrderRepository implements OrderRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('FakeOrderRepository: issue #7');
}

class FakeAccountRepository implements AccountRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('FakeAccountRepository: issue #7');
}

class FakeInventoryRepository implements InventoryRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('FakeInventoryRepository: issue #7');
}

class FakeAdminRepository implements AdminRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('FakeAdminRepository: issue #7');
}
