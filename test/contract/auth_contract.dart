import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/app_exception.dart';
import 'package:los_pollos_hermanos/data/fake/fake_seed.dart';
import 'package:los_pollos_hermanos/models/app_user.dart';

import 'contract_env.dart';

Future<AppUser?> _next(StreamIterator<AppUser?> it) async {
  expect(await it.moveNext(), isTrue);
  return it.current;
}

/// AuthRepository behaviour every adapter must have.
void authContract(EnvFactory makeEnv) {
  group('AuthRepository contract', () {
    test(
      'watchUser emits null, the customer after signIn, null after signOut',
      () async {
        final env = await makeEnv();
        final it = StreamIterator(env.auth.watchUser());
        addTearDown(it.cancel);

        expect(await _next(it), isNull);
        await env.signInAs(SeedIds.customerEmail);
        final user = await _next(it);
        expect(user?.email, SeedIds.customerEmail);
        expect(user?.role, UserRole.customer);
        await env.auth.signOut();
        expect(await _next(it), isNull);
      },
    );

    test('a banned customer can sign in and is flagged', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.bannedEmail);
      expect(
        await env.auth.watchUser().first,
        isA<AppUser>().having((u) => u.isBanned, 'isBanned', isTrue),
      );
    });

    test('a wrong password throws InvalidCredentialsException', () {
      expect(
        makeEnv().then(
          (e) => e.auth.signIn(SeedIds.customerEmail, 'Wrong-pass-1'),
        ),
        throwsA(isA<InvalidCredentialsException>()),
      );
    });

    test('an unknown email throws InvalidCredentialsException', () {
      expect(
        makeEnv().then(
          (e) => e.auth.signIn('nobody@pollos.test', SeedIds.password),
        ),
        throwsA(isA<InvalidCredentialsException>()),
      );
    });

    test('signUp completes for a new email', () async {
      final env = await makeEnv();
      final email = 'new.${DateTime.now().microsecondsSinceEpoch}@pollos.test';
      await env.auth.signUp(
        fullName: 'Nia New',
        email: email,
        password: SeedIds.password,
      );
    });

    test('signUp with an existing email throws EmailInUseException', () async {
      final env = await makeEnv();
      expect(
        env.auth.signUp(
          fullName: 'Dup',
          email: SeedIds.customerEmail,
          password: SeedIds.password,
        ),
        throwsA(isA<EmailInUseException>()),
      );
    });

    test('signUp with a weak password throws WeakPasswordException', () async {
      final env = await makeEnv();
      expect(
        env.auth.signUp(
          fullName: 'Weak',
          email: 'weak@pollos.test',
          password: 'short',
        ),
        throwsA(isA<WeakPasswordException>()),
      );
    });
  });
}
