import '../contract/cart_contract.dart';
import '../contract/checkout_contract.dart';
import '../contract/fake_env.dart';

void main() {
  cartContract(fakeEnv);
  checkoutContract(fakeEnv);
}
