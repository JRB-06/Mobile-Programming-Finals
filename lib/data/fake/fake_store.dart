import 'dart:async';

import '../../core/app_exception.dart';
import '../../core/money.dart';
import '../../models/account.dart';
import '../../models/app_user.dart';
import '../../models/category.dart';
import '../../models/inventory.dart';
import '../../models/order.dart';
import '../../models/page.dart';
import '../../models/pharmacist.dart';
import '../../models/product.dart';
import '../../models/review.dart';
import 'fake_seed.dart';

/// A Review plus the OrderItem it was written for (the Review model has no
/// order item id; the Supabase table has `reviews.order_item_id`).
typedef StoredReview = ({Review review, String orderItemId});

const pageSize = 20;

/// Slice of [all] for [page] (0-based), 20 per page, like the real backend.
Page<T> paginate<T>(List<T> all, int page) {
  page = page < 0 ? 0 : page;
  return Page(
    items: all.skip(page * pageSize).take(pageSize).toList(),
    page: page,
    hasMore: all.length > (page + 1) * pageSize,
  );
}

/// The one mutable in-memory "backend" every Fake shares, so a cart change is
/// seen by checkout, an admin ban by checkout, an archive by the catalog.
///
/// Plain public collections: Fakes read and mutate them directly, then call
/// [notify] so streams ([watch]) re-emit. Maps keep insertion order, and
/// insertion order is "oldest first" (the catalog's `newest` sort reverses it).
class FakeStore {
  FakeStore({this.latency = defaultLatency});

  /// A store loaded with the seed (see fake_seed.dart).
  factory FakeStore.seeded({Duration latency = defaultLatency}) =>
      FakeStore(latency: latency)..loadSeed();

  static const defaultLatency = Duration(milliseconds: 300);

  /// Simulated network time; tests pass [Duration.zero].
  final Duration latency;

  final users = <String, AppUser>{}; // by id
  final passwords = <String, String>{}; // by lower-case email
  final pharmacists = <String, Pharmacist>{};
  final categories = <String, Category>{};

  /// `variants` on these is unused (see [variants]); `images` holds the paths.
  final products = <String, ManagedProduct>{};
  final variants = <String, Variant>{};
  final addresses = <String, List<Address>>{}; // by user id
  final cards = <String, List<SavedCard>>{}; // by user id
  final orders = <String, Order>{};
  final orderItems = <String, OrderItem>{};
  final orderAddresses = <String, Address>{}; // snapshot, by order id
  final reviews = <StoredReview>[];

  /// The Cart: variant id to qty. Global, not per user; signOut clears it.
  final cartLines = <String, int>{};

  Money shippingFee = const Money(5000);
  String? currentUserId;

  final _changes = StreamController<void>.broadcast();

  Future<void> delay() => Future<void>.delayed(latency);

  /// Fires after every mutation (see [notify]).
  Stream<void> get changes => _changes.stream;

  /// Call after any mutation.
  void notify() => _changes.add(null);

  /// Emits [read] now, then again after every [notify] if the value changed.
  Stream<T> watch<T>(T Function() read) {
    late StreamController<T> c;
    StreamSubscription<void>? sub;
    c = StreamController<T>(
      onListen: () {
        c.add(read());
        sub = changes.listen((_) => c.add(read()));
      },
      onCancel: () => sub?.cancel(),
    );
    return c.stream.distinct();
  }

  AppUser? get currentUser => users[currentUserId];

  /// Throws [PermissionException] when logged out.
  AppUser requireUser() => currentUser ?? (throw const PermissionException());

  /// Throws [PermissionException] unless the current user is an Admin.
  AppUser requireAdmin() {
    final u = requireUser();
    if (u.role != UserRole.admin) throw const PermissionException();
    return u;
  }

  /// Whether [v] can be bought: the Variant, its Product and its Pharmacist
  /// are all live. Stock is checked separately.
  bool isSellable(Variant v) {
    final p = products[v.productId];
    return !v.archived &&
        p != null &&
        !p.archived &&
        pharmacists[p.pharmacistId]?.archived == false;
  }

  /// Closes the change stream; the provider calls this on dispose.
  void dispose() => _changes.close();

  void loadSeed() => seedStore(this);
}
