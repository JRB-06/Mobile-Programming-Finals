import 'package:los_pollos_hermanos/models/inventory.dart';

sealed class AppException implements Exception {
  const AppException();

  /// Plain text a user can read.
  String get message;

  @override
  String toString() => message;
}

final class OfflineException extends AppException {
  const OfflineException();
  @override
  String get message => 'You\'re offline. Connect to the internet to do this.';
}

final class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException();
  @override
  String get message => 'Wrong email or password.';
}

final class EmailNotConfirmedException extends AppException {
  const EmailNotConfirmedException();
  @override
  String get message => 'Please confirm your email first.';
}

final class EmailInUseException extends AppException {
  const EmailInUseException();
  @override
  String get message => 'An account with this email already exists.';
}

final class WeakPasswordException extends AppException {
  const WeakPasswordException();
  @override
  String get message => 'Use at least 8 characters, including a number.';
}

final class PermissionException extends AppException {
  const PermissionException();
  @override
  String get message => 'You don\'t have permission to do that.';
}

final class BannedException extends AppException {
  const BannedException();
  @override
  String get message =>
      'Your account is suspended. You can browse but not buy.';
}

final class CardDeclinedException extends AppException {
  const CardDeclinedException();
  @override
  String get message => 'Your card was declined. Try another card.';
}

final class InvalidTransitionException extends AppException {
  const InvalidTransitionException();
  @override
  String get message => 'This order can\'t be changed that way any more.';
}

final class AlreadyReviewedException extends AppException {
  const AlreadyReviewedException();
  @override
  String get message => 'You\'ve already reviewed this item.';
}

final class HasOrdersException extends AppException {
  const HasOrdersException();
  @override
  String get message => 'This product has orders. Archive it instead.';
}

final class InUseException extends AppException {
  const InUseException();
  @override
  String get message => 'Move or archive its products first.';
}

final class OutOfStockException extends AppException {
  const OutOfStockException(this.variantId);
  final String variantId;
  @override
  String get message => 'That item just sold out. We\'ve updated your cart.';
}

final class UnavailableException extends AppException {
  const UnavailableException(this.variantId);
  final String variantId;
  @override
  String get message => 'That item is no longer available.';
}

/// Rows were saved but an image upload failed; [product] is what was saved.
final class PartialSaveException extends AppException {
  const PartialSaveException(this.product);
  final ManagedProduct product;
  @override
  String get message => 'Saved, but some images failed to upload. Try again.';
}

final class ValidationException extends AppException {
  const ValidationException(this.field, this.message);
  final String field;
  @override
  final String message;
}

final class UnknownException extends AppException {
  const UnknownException(this.cause);
  final Object cause;
  @override
  String get message => 'Something went wrong. Please try again.';
}
