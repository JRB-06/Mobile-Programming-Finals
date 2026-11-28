import 'package:uuid/uuid.dart';

import '../../core/app_exception.dart';
import '../../models/app_user.dart';
import '../repositories.dart';
import 'fake_seed.dart';
import 'fake_store.dart';

/// Behaviour notes:
/// - [signUp] creates a customer but does not sign in (mirrors the email
///   confirmation flow); call [signIn] afterwards.
/// - [signInWithGoogle] signs in the seed customer.
/// - Banned users can sign in; the ban is only visible on [AppUser.isBanned].
class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository(this.store);

  final FakeStore store;

  @override
  Stream<AppUser?> watchUser() => store.watch(() => store.currentUser);

  @override
  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    await store.delay();
    final key = email.trim().toLowerCase();
    if (store.passwords.containsKey(key)) throw const EmailInUseException();
    _checkPassword(password);
    final id = const Uuid().v4();
    store.users[id] = AppUser(id: id, email: key, fullName: fullName.trim());
    store.passwords[key] = password;
    store.notify();
  }

  @override
  Future<void> signIn(String email, String password) async {
    await store.delay();
    final key = email.trim().toLowerCase();
    final user = store.users.values.where((u) => u.email == key).firstOrNull;
    if (user == null || store.passwords[key] != password) {
      throw const InvalidCredentialsException();
    }
    store.currentUserId = user.id;
    store.notify();
  }

  @override
  Future<void> signInWithGoogle() async {
    await store.delay();
    store.currentUserId = SeedIds.customerId;
    store.notify();
  }

  @override
  Future<void> resendConfirmation(String email) => store.delay();

  @override
  Future<void> sendPasswordReset(String email) => store.delay();

  @override
  Future<void> updatePassword(String newPassword) async {
    await store.delay();
    final user = store.requireUser();
    _checkPassword(newPassword);
    store.passwords[user.email] = newPassword;
  }

  @override
  Future<void> signOut() async {
    await store.delay();
    store.currentUserId = null;
    store.cartLines.clear();
    store.notify();
  }

  void _checkPassword(String p) {
    if (p.length < 8 || !p.contains(RegExp(r'\d'))) {
      throw const WeakPasswordException();
    }
  }
}
