import 'package:flutter_test/flutter_test.dart';
import 'package:los_pollos_hermanos/core/app_exception.dart';
import 'package:los_pollos_hermanos/data/fake/fake_seed.dart';
import 'package:los_pollos_hermanos/models/app_user.dart';

import '../contract/auth_contract.dart';
import '../contract/catalog_contract.dart';
import '../contract/fake_env.dart';

void main() {
  authContract(fakeEnv);
  catalogContract(fakeEnv);

  group('Fake-only choices', () {
    test(
      'signUp then signIn works (real Supabase needs email confirmation)',
      () async {
        final env = await fakeEnv();
        await env.auth.signUp(
          fullName: 'Nia New',
          email: 'nia@pollos.test',
          password: SeedIds.password,
        );
        await env.auth.signIn('nia@pollos.test', SeedIds.password);
        final user = await env.auth.watchUser().first;
        expect(user?.fullName, 'Nia New');
        expect(user?.role, UserRole.customer);
      },
    );

    test(
      'archived and not-shown products throw UnavailableException',
      () async {
        final env = await fakeEnv();
        await env.signInAs(SeedIds.customerEmail);
        for (final id in [
          SeedIds.archivedProductId,
          SeedIds.archivedPharmacistProductId,
          SeedIds.allVariantsArchivedProductId,
        ]) {
          expect(
            env.catalog.getProduct(id),
            throwsA(isA<UnavailableException>()),
          );
        }
      },
    );
  });
}
