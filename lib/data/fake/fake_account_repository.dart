import 'dart:io';

import 'package:uuid/uuid.dart';

import '../../core/app_exception.dart';
import '../../core/card_validator.dart';
import '../../models/account.dart';
import '../../models/app_user.dart';
import '../repositories.dart';
import 'fake_store.dart';

/// Behaviour notes:
/// - A Customer sees and changes only their own addresses and cards.
/// - [saveAddress] and [setDefaultCard] on another user's row throw
///   [PermissionException]; [deleteAddress] and [deleteCard] do nothing.
/// - Cards keep brand, last4 and expiry only; the number and CVV are checked
///   by [checkCard] and then dropped.
class FakeAccountRepository implements AccountRepository {
  FakeAccountRepository(this.store);

  final FakeStore store;

  List<Address> _addresses() =>
      store.addresses[store.requireUser().id] ??= <Address>[];

  List<SavedCard> _cards() =>
      store.cards[store.requireUser().id] ??= <SavedCard>[];

  @override
  Future<AppUser> updateProfile({
    String? fullName,
    String? phone,
    File? avatar,
  }) async {
    await store.delay();
    final user = store.requireUser();
    final updated = user.copyWith(
      fullName: fullName?.trim() ?? user.fullName,
      phone: phone ?? user.phone,
      avatarUrl: avatar == null
          ? user.avatarUrl
          : 'https://example.test/avatars/${user.id}.jpg',
    );
    store.users[user.id] = updated;
    store.notify();
    return updated;
  }

  @override
  Future<List<Address>> addresses() async {
    await store.delay();
    return List.of(_addresses());
  }

  @override
  Future<Address> saveAddress(AddressInput a) async {
    await store.delay();
    final mine = _addresses();
    final index = a.id == null ? -1 : mine.indexWhere((x) => x.id == a.id);
    if (a.id != null && index == -1) throw const PermissionException();
    if (a.isDefault) {
      for (var i = 0; i < mine.length; i++) {
        mine[i] = mine[i].copyWith(isDefault: false);
      }
    }
    final saved = Address(
      id: a.id ?? const Uuid().v4(),
      label: a.label,
      line1: a.line1,
      line2: a.line2,
      city: a.city,
      province: a.province,
      postalCode: a.postalCode,
      country: a.country,
      isDefault: a.isDefault,
    );
    if (index == -1) {
      mine.add(saved);
    } else {
      mine[index] = saved;
    }
    store.notify();
    return saved;
  }

  @override
  Future<void> deleteAddress(String id) async {
    await store.delay();
    _addresses().removeWhere((x) => x.id == id);
    store.notify();
  }

  @override
  Future<List<SavedCard>> cards() async {
    await store.delay();
    return List.of(_cards());
  }

  @override
  Future<SavedCard> addCard(CardInput c) async {
    await store.delay();
    final mine = _cards();
    final check = checkCard(c.number, c.expMonth, c.expYear, c.cvv);
    if (check is CardInvalid) {
      throw ValidationException(check.field.name, check.message);
    }
    final valid = check as CardValid;
    final card = SavedCard(
      id: const Uuid().v4(),
      brand: valid.brand,
      last4: valid.last4,
      expMonth: c.expMonth,
      expYear: c.expYear < 100 ? 2000 + c.expYear : c.expYear,
    );
    mine.add(card);
    store.notify();
    return card;
  }

  @override
  Future<void> deleteCard(String id) async {
    await store.delay();
    _cards().removeWhere((x) => x.id == id);
    store.notify();
  }

  @override
  Future<void> setDefaultCard(String id) async {
    await store.delay();
    final mine = _cards();
    if (!mine.any((x) => x.id == id)) throw const PermissionException();
    for (var i = 0; i < mine.length; i++) {
      mine[i] = mine[i].copyWith(isDefault: mine[i].id == id);
    }
    store.notify();
  }
}
