import 'dart:io';

import '../core/money.dart';
import '../core/order_status.dart';
import '../models/account.dart';
import '../models/admin.dart';
import '../models/app_user.dart';
import '../models/cart.dart';
import '../models/category.dart';
import '../models/inventory.dart';
import '../models/order.dart';
import '../models/page.dart';
import '../models/pharmacist.dart';
import '../models/product.dart';
import '../models/review.dart';

abstract interface class AuthRepository {
  Stream<AppUser?> watchUser();
  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  });
  Future<void> signIn(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> resendConfirmation(String email);
  Future<void> sendPasswordReset(String email);
  Future<void> updatePassword(String newPassword);
  Future<void> signOut();
}

abstract interface class CatalogRepository {
  Future<Page<Pharmacist>> pharmacists({String query = '', int page = 0});
  Future<Page<ProductCard>> searchProducts({
    String query = '',
    ProductFilter filter = const ProductFilter(),
    int page = 0,
  });
  Future<ProductDetail> getProduct(String productId);
  Future<Page<Review>> productReviews(String productId, {int page = 0});
  Future<List<Category>> categories();
}

abstract interface class CartRepository {
  Stream<Cart> watchCart();
  Future<void> add(String variantId, {int qty = 1});
  Future<void> setQty(String variantId, int qty);
  Future<void> remove(String variantId);
}

abstract interface class CheckoutRepository {
  Future<Order> placeOrder({
    required String orderId,
    required String addressId,
    required String cardId,
  });
  Future<Money> shippingFee();
}

abstract interface class OrderRepository {
  Future<Page<Order>> list({OrderStatus? status, int page = 0});
  Future<OrderDetail> get(String orderId);
  Future<Order> cancel(String orderId);
  Future<Order> advance(String orderId);
  Future<void> review(
    String orderItemId, {
    required int rating,
    String? comment,
  });
}

abstract interface class AccountRepository {
  Future<AppUser> updateProfile({
    String? fullName,
    String? phone,
    File? avatar,
  });
  Future<List<Address>> addresses();
  Future<Address> saveAddress(AddressInput a);
  Future<void> deleteAddress(String id);
  Future<List<SavedCard>> cards();
  Future<SavedCard> addCard(CardInput c);
  Future<void> deleteCard(String id);
  Future<void> setDefaultCard(String id);
}

abstract interface class InventoryRepository {
  Future<Page<Pharmacist>> pharmacists({
    String query = '',
    bool includeArchived = false,
    int page = 0,
  });
  Future<Pharmacist> savePharmacist(PharmacistInput p);
  Future<void> setPharmacistArchived(String pharmacistId, bool archived);
  Future<Page<ManagedProduct>> products({
    String query = '',
    bool includeArchived = false,
    int page = 0,
  });
  Future<ManagedProduct> getProduct(String productId);
  Future<ManagedProduct> saveProduct(ProductInput p);
  Future<void> setArchived(String productId, bool archived);
  Future<void> deleteProduct(String productId);
  Future<List<LowStockVariant>> lowStock();
  Future<Category> saveCategory(CategoryInput c);
  Future<void> deleteCategory(String id);
}

abstract interface class AdminRepository {
  Future<Page<CustomerRow>> customers({String query = '', int page = 0});
  Future<void> setBanned(String userId, bool banned);
  Future<void> setShippingFee(Money fee);
  Future<Dashboard> dashboard();
}
