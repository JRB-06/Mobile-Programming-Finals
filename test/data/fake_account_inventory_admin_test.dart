import '../contract/account_contract.dart';
import '../contract/admin_contract.dart';
import '../contract/fake_env.dart';
import '../contract/inventory_contract.dart';

void main() {
  accountContract(fakeEnv);
  inventoryContract(fakeEnv);
  adminContract(fakeEnv);
}
