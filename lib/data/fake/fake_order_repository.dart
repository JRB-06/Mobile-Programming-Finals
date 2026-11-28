import 'package:uuid/uuid.dart';

import '../../core/app_exception.dart';
import '../../core/order_status.dart';
import '../../models/admin.dart';
import '../../models/app_user.dart';
import '../../models/order.dart';
import '../../models/page.dart';
import '../../models/review.dart';
import '../repositories.dart';
import 'fake_store.dart';

/// Behaviour notes:
/// - A Customer sees only their own Orders; someone else's Order throws
///   [PermissionException] (RLS hides it; the Fake picks that error).
/// - Lists are newest first.
/// - The timeline is derived from the status (paid up to the current one; a
///   cancelled Order shows [paid, cancelled]): the Fake keeps no history.
/// - Banned Customers can still cancel (a ban only blocks placing and reviewing).
/// - Review checks, in order: permission, banned, rating, delivered, once only.
class FakeOrderRepository implements OrderRepository {
  FakeOrderRepository(this.store);

  final FakeStore store;

  Order _visible(AppUser user, String orderId) {
    final order = store.orders[orderId];
    if (order == null ||
        (user.role != UserRole.admin && order.customerId != user.id)) {
      throw const PermissionException();
    }
    return order;
  }

  void _notBanned(AppUser user) {
    if (user.isBanned) throw const BannedException();
  }

  @override
  Future<Page<Order>> list({OrderStatus? status, int page = 0}) async {
    await store.delay();
    final user = store.requireUser();
    final seen = store.orders.values.where(
      (o) =>
          (user.role == UserRole.admin || o.customerId == user.id) &&
          (status == null || o.status == status),
    );
    final all = seen.toList()
      ..sort((a, b) {
        final c = b.createdAt.compareTo(a.createdAt);
        return c != 0 ? c : b.id.compareTo(a.id);
      });
    return paginate(all, page);
  }

  @override
  Future<OrderDetail> get(String orderId) async {
    await store.delay();
    final user = store.requireUser();
    final order = _visible(user, orderId);
    final items = store.orderItems.values
        .where((i) => i.orderId == orderId)
        .toList();
    final reviewed = {for (final r in store.reviews) r.orderItemId};
    final isCustomer = user.role == UserRole.customer;
    final owner = store.users[order.customerId];
    return OrderDetail(
      order: order,
      items: items,
      shippingAddress: store.orderAddresses[orderId],
      timeline: _timeline(order.status),
      reviewableItemIds: isCustomer && order.status == OrderStatus.delivered
          ? [
              for (final i in items)
                if (!reviewed.contains(i.id)) i.id,
            ]
          : const [],
      customer: !isCustomer && owner != null
          ? CustomerRow(
              id: owner.id,
              fullName: owner.fullName,
              email: owner.email,
              phone: owner.phone,
              isBanned: owner.isBanned,
              orderCount: store.orders.values
                  .where((o) => o.customerId == owner.id)
                  .length,
            )
          : null,
    );
  }

  List<OrderStatus> _timeline(OrderStatus status) {
    if (status == OrderStatus.cancelled) {
      return const [OrderStatus.paid, OrderStatus.cancelled];
    }
    return [
      for (final s in OrderStatus.values)
        if (s != OrderStatus.cancelled && s.index <= status.index) s,
    ];
  }

  Order _setStatus(Order order, OrderStatus status) {
    final updated = order.copyWith(
      status: status,
      statusUpdatedAt: DateTime.now().toUtc(),
    );
    store.orders[order.id] = updated;
    return updated;
  }

  @override
  Future<Order> cancel(String orderId) async {
    await store.delay();
    final user = store.requireUser();
    final order = _visible(user, orderId);
    final ok = user.role == UserRole.admin
        ? order.status.canAdminCancel
        : order.status.canCustomerCancel;
    if (!ok) throw const InvalidTransitionException();
    for (final i in store.orderItems.values.where(
      (i) => i.orderId == orderId,
    )) {
      final v = store.variants[i.variantId];
      if (v != null) store.variants[v.id] = v.copyWith(stock: v.stock + i.qty);
    }
    final updated = _setStatus(order, OrderStatus.cancelled);
    store.notify();
    return updated;
  }

  @override
  Future<Order> advance(String orderId) async {
    await store.delay();
    final admin = store.requireAdmin();
    final order = _visible(admin, orderId);
    final next = order.status.next;
    if (next == null) throw const InvalidTransitionException();
    final updated = _setStatus(order, next);
    store.notify();
    return updated;
  }

  @override
  Future<void> review(
    String orderItemId, {
    required int rating,
    String? comment,
  }) async {
    await store.delay();
    final user = store.requireUser();
    final item = store.orderItems[orderItemId];
    if (user.role != UserRole.customer ||
        item == null ||
        store.orders[item.orderId]?.customerId != user.id) {
      throw const PermissionException();
    }
    _notBanned(user);
    if (rating < 1 || rating > 5) {
      throw const ValidationException('rating', 'Pick a rating from 1 to 5.');
    }
    if (store.orders[item.orderId]!.status != OrderStatus.delivered) {
      throw const InvalidTransitionException();
    }
    if (store.reviews.any((r) => r.orderItemId == orderItemId)) {
      throw const AlreadyReviewedException();
    }
    store.reviews.add((
      review: Review(
        id: const Uuid().v4(),
        productId: item.productId,
        rating: rating,
        comment: comment,
        reviewerName: user.fullName,
        createdAt: DateTime.now().toUtc(),
      ),
      orderItemId: orderItemId,
    ));
    store.notify();
  }
}
