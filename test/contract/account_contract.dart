import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/app_exception.dart';
import 'package:los_pollos_hermanos/core/card_validator.dart';
import 'package:los_pollos_hermanos/data/fake/fake_seed.dart';
import 'package:los_pollos_hermanos/models/account.dart';

import 'contract_env.dart';

/// A real file on disk, so no test hands the repository a missing path.
File _tempFile(String name) {
  final dir = Directory.systemTemp.createTempSync('pollos_account_');
  return File.fromUri(dir.uri.resolve(name))
    ..writeAsBytesSync([0xFF, 0xD8, 0xFF, 0xE0]);
}

/// AccountRepository behaviour every adapter must have (Customer self-service).
void accountContract(EnvFactory makeEnv) {
  group('AccountRepository contract', () {
    test('addCard rejects a number that fails the Luhn check', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      await expectLater(
        env.account.addCard(
          const CardInput(
            number: '4242424242424241',
            expMonth: 12,
            expYear: 2099,
            cvv: '123',
          ),
        ),
        throwsA(
          isA<ValidationException>().having((e) => e.field, 'field', 'number'),
        ),
      );
    });

    test('addCard keeps brand, last4 and expiry, and lists the card', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final before = (await env.account.cards()).map((c) => c.id).toList();
      final card = await env.account.addCard(
        const CardInput(
          number: '4111 1111 1111 1111',
          expMonth: 12,
          expYear: 2099,
          cvv: '123',
        ),
      );
      expect(card.brand, CardBrand.visa);
      expect(card.last4, '1111');
      expect(card.expMonth, 12);
      expect(card.expYear, 2099);
      final after = (await env.account.cards()).map((c) => c.id);
      expect(after, unorderedEquals([...before, card.id]));
    });

    test('addCard stores a two-digit expiry year as 20xx', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final card = await env.account.addCard(
        const CardInput(
          number: '4111111111111111',
          expMonth: 12,
          expYear: 99,
          cvv: '123',
        ),
      );
      expect(card.expYear, 2099);
    });

    test('addCard rejects an expired card and a bad CVV', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      await expectLater(
        env.account.addCard(
          const CardInput(
            number: '4111111111111111',
            expMonth: 1,
            expYear: 2020,
            cvv: '123',
          ),
        ),
        throwsA(
          isA<ValidationException>().having((e) => e.field, 'field', 'expiry'),
        ),
      );
      await expectLater(
        env.account.addCard(
          const CardInput(
            number: '4111111111111111',
            expMonth: 12,
            expYear: 2099,
            cvv: 'ab',
          ),
        ),
        throwsA(
          isA<ValidationException>().having((e) => e.field, 'field', 'cvv'),
        ),
      );
    });

    test('setDefaultCard moves the default to that card only', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      await env.account.setDefaultCard(SeedIds.declinedCardId);
      final byId = {for (final c in await env.account.cards()) c.id: c};
      expect(byId[SeedIds.declinedCardId]!.isDefault, isTrue);
      expect(byId[SeedIds.goodCardId]!.isDefault, isFalse);
    });

    test('deleteCard removes only that card', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final before = (await env.account.cards()).map((c) => c.id).toList();
      await env.account.deleteCard(SeedIds.declinedCardId);
      final after = (await env.account.cards()).map((c) => c.id);
      expect(
        after,
        unorderedEquals(before.where((id) => id != SeedIds.declinedCardId)),
      );
    });

    test("another Customer's card cannot be set default, and deleting it changes nothing", () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.bannedEmail);
      final bannedBefore = (await env.account.cards())
          .map((c) => c.id)
          .toList();
      await env.signInAs(SeedIds.customerEmail);
      await expectLater(
        env.account.setDefaultCard(SeedIds.bannedCardId),
        throwsA(isA<PermissionException>()),
      );
      await env.account.deleteCard(SeedIds.bannedCardId);
      await env.signInAs(SeedIds.bannedEmail);
      final cards = await env.account.cards();
      expect(cards.map((c) => c.id), unorderedEquals(bannedBefore));
      expect(
        cards.singleWhere((c) => c.id == SeedIds.bannedCardId).isDefault,
        isTrue,
      );
    });

    test("addresses lists the Customer's own, with the seeded default flag on the first", () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final all = await env.account.addresses();
      expect(
        all.map((a) => a.id),
        unorderedEquals([
          SeedIds.customerAddressId,
          SeedIds.customerSecondAddressId,
        ]),
      );
      // Seed-dependent: the Supabase seed (#19) must match the Fake seed.
      expect(
        all.singleWhere((a) => a.id == SeedIds.customerAddressId).isDefault,
        isTrue,
      );
      expect(
        all
            .singleWhere((a) => a.id == SeedIds.customerSecondAddressId)
            .isDefault,
        isFalse,
      );
    });

    test('saveAddress with a null id creates an address', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final before = (await env.account.addresses()).length;
      final created = await env.account.saveAddress(
        const AddressInput(
          label: 'Gym',
          line1: '5 Ayala Ave',
          city: 'Makati',
          province: 'Metro Manila',
          postalCode: '1226',
        ),
      );
      expect(created.id, isNotEmpty);
      final all = await env.account.addresses();
      expect(all, hasLength(before + 1));
      expect(all.map((a) => a.id), contains(created.id));
    });

    test(
      'saveAddress with an id updates it, and isDefault unsets the others',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.customerEmail);
        await env.account.saveAddress(
          const AddressInput(
            id: SeedIds.customerSecondAddressId,
            label: 'Work',
            line1: '9 Rizal Rd',
            city: 'Pasig',
            province: 'Metro Manila',
            postalCode: '1600',
            isDefault: true,
          ),
        );
        final all = await env.account.addresses();
        expect(
          all.map((a) => a.id),
          unorderedEquals([
            SeedIds.customerAddressId,
            SeedIds.customerSecondAddressId,
          ]),
        );
        final byId = {for (final a in all) a.id: a};
        expect(byId[SeedIds.customerSecondAddressId]!.line1, '9 Rizal Rd');
        expect(byId[SeedIds.customerSecondAddressId]!.isDefault, isTrue);
        expect(byId[SeedIds.customerAddressId]!.isDefault, isFalse);
      },
    );

    test("another Customer's address cannot be saved, and deleting it changes nothing", () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.bannedEmail);
      final bannedBefore = (await env.account.addresses())
          .map((a) => a.id)
          .toList();
      await env.signInAs(SeedIds.customerEmail);
      await expectLater(
        env.account.saveAddress(
          const AddressInput(
            id: SeedIds.bannedAddressId,
            label: 'Home',
            line1: 'x',
            city: 'x',
            province: 'x',
            postalCode: '0000',
          ),
        ),
        throwsA(isA<PermissionException>()),
      );
      await env.account.deleteAddress(SeedIds.bannedAddressId);
      await env.signInAs(SeedIds.bannedEmail);
      expect(
        (await env.account.addresses()).map((a) => a.id),
        unorderedEquals(bannedBefore),
      );
    });

    test("deleteAddress removes one of the Customer's addresses", () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final before = (await env.account.addresses()).map((a) => a.id).toList();
      await env.account.deleteAddress(SeedIds.customerSecondAddressId);
      final after = (await env.account.addresses()).map((a) => a.id);
      expect(
        after,
        unorderedEquals(
          before.where((id) => id != SeedIds.customerSecondAddressId),
        ),
      );
    });

    test(
      'updateProfile changes name and phone, visible through watchUser',
      () async {
        final env = await makeEnv();
        await env.signInAs(SeedIds.customerEmail);
        final updated = await env.account.updateProfile(
          fullName: 'Cleo Q. Customer',
          phone: '+639171234567',
        );
        expect(updated.fullName, 'Cleo Q. Customer');
        expect(updated.phone, '+639171234567');
        final seen = await env.auth.watchUser().first;
        expect(seen?.fullName, 'Cleo Q. Customer');
        expect(seen?.phone, '+639171234567');
      },
    );

    test('updateProfile with an avatar sets an avatar url', () async {
      final env = await makeEnv();
      await env.signInAs(SeedIds.customerEmail);
      final avatar = _tempFile('avatar.jpg');
      addTearDown(() => avatar.parent.deleteSync(recursive: true));
      final updated = await env.account.updateProfile(avatar: avatar);
      expect(updated.avatarUrl, isNotNull);
    });

    test('every account method needs a signed-in user', () async {
      final env = await makeEnv();
      final avatar = _tempFile('avatar.jpg');
      addTearDown(() => avatar.parent.deleteSync(recursive: true));
      final calls = <String, Future<Object?> Function()>{
        'updateProfile': () =>
            env.account.updateProfile(fullName: 'X', avatar: avatar),
        'addresses': () => env.account.addresses(),
        'saveAddress': () => env.account.saveAddress(
          const AddressInput(
            label: 'L',
            line1: 'x',
            city: 'x',
            province: 'x',
            postalCode: '0000',
          ),
        ),
        'deleteAddress': () =>
            env.account.deleteAddress(SeedIds.customerAddressId),
        'cards': () => env.account.cards(),
        'addCard': () => env.account.addCard(
          const CardInput(
            number: '4111111111111111',
            expMonth: 12,
            expYear: 2099,
            cvv: '123',
          ),
        ),
        'deleteCard': () => env.account.deleteCard(SeedIds.goodCardId),
        'setDefaultCard': () => env.account.setDefaultCard(SeedIds.goodCardId),
      };
      for (final e in calls.entries) {
        await expectLater(
          e.value(),
          throwsA(isA<PermissionException>()),
          reason: e.key,
        );
      }
    });
  });
}
