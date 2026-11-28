import '../../core/app_exception.dart';
import '../../core/money.dart';
import '../../core/order_status.dart';
import '../../models/admin.dart';
import '../../models/app_user.dart';
import '../../models/page.dart';
import '../repositories.dart';
import 'fake_inventory_repository.dart';
import 'fake_store.dart';

/// Behaviour notes:
/// - Every method needs the Admin.
/// - [customers] lists Customers only (not the Admin), matched by name or email.
/// - [setShippingFee] rejects a negative fee and changes only later Orders;
///   Orders already placed keep the fee they were given.
/// - [dashboard] revenue is the total of delivered Orders only.
class FakeAdminRepository implements AdminRepository {
  FakeAdminRepository(this.store);

  final FakeStore store;

  @override
  Future<Page<CustomerRow>> customers({String query = '', int page = 0}) async {
    await store.delay();
    store.requireAdmin();
    final q = query.trim().toLowerCase();
    return paginate([
      for (final u in store.users.values)
        if (u.role == UserRole.customer &&
            (u.fullName.toLowerCase().contains(q) ||
                u.email.toLowerCase().contains(q)))
          _row(u),
    ], page);
  }

  @override
  Future<void> setBanned(String userId, bool banned) async {
    await store.delay();
    store.requireAdmin();
    final user = store.users[userId] ?? (throw UnavailableException(userId));
    if (user.role == UserRole.admin) throw const PermissionException();
    store.users[userId] = user.copyWith(isBanned: banned);
    store.notify();
  }

  @override
  Future<void> setShippingFee(Money fee) async {
    await store.delay();
    store.requireAdmin();
    if (fee.centavos < 0) {
      throw const ValidationException('fee', "Shipping fee can't be negative");
    }
    store.shippingFee = fee;
    store.notify();
  }

  @override
  Future<Dashboard> dashboard() async {
    await store.delay();
    store.requireAdmin();
    final byStatus = {for (final s in OrderStatus.values) s: 0};
    var revenue = Money.zero;
    for (final o in store.orders.values) {
      byStatus[o.status] = byStatus[o.status]! + 1;
      if (o.status == OrderStatus.delivered) revenue = revenue + o.total;
    }
    return Dashboard(
      revenue: revenue,
      ordersByStatus: byStatus,
      customerCount: store.users.values
          .where((u) => u.role == UserRole.customer)
          .length,
      lowStockCount: store.variants.values.where(isLowStock).length,
    );
  }

  CustomerRow _row(AppUser u) => CustomerRow(
    id: u.id,
    fullName: u.fullName,
    email: u.email,
    phone: u.phone,
    isBanned: u.isBanned,
    orderCount: store.orders.values.where((o) => o.customerId == u.id).length,
  );
}
