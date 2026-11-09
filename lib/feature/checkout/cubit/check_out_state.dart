import 'package:task1fassla/feature/checkout/payment_method_section.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutFormUpdated extends CheckoutState {
  final PaymentMethod paymentMethod;

  CheckoutFormUpdated({
    required this.paymentMethod,
  });
}

class CheckoutSuccess extends CheckoutState {
  final String message;

  CheckoutSuccess(this.message);
}

class CheckoutError extends CheckoutState {
  final String message;

  CheckoutError(this.message);
}