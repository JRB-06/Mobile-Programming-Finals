// shortcut: stubs until issue #7 (fakes) / #9+ (Supabase) fill them in.
import '../repositories.dart';

class SupabaseAuthRepository implements AuthRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('SupabaseAuthRepository: issue #9+');
}

class SupabaseCatalogRepository implements CatalogRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('SupabaseCatalogRepository: issue #9+');
}

class SupabaseCartRepository implements CartRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('SupabaseCartRepository: issue #9+');
}

class SupabaseCheckoutRepository implements CheckoutRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('SupabaseCheckoutRepository: issue #9+');
}

class SupabaseOrderRepository implements OrderRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('SupabaseOrderRepository: issue #9+');
}

class SupabaseAccountRepository implements AccountRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('SupabaseAccountRepository: issue #9+');
}

class SupabaseInventoryRepository implements InventoryRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('SupabaseInventoryRepository: issue #9+');
}

class SupabaseAdminRepository implements AdminRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('SupabaseAdminRepository: issue #9+');
}
