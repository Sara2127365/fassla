import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1fassla/feature/checkout/cubit/check_out_state.dart';
import 'package:task1fassla/feature/checkout/payment_method_section.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  PaymentMethod paymentMethod = PaymentMethod.cash;

  void updatePaymentMethod(PaymentMethod method) {
    paymentMethod = method;

    emit(
      CheckoutFormUpdated(
        paymentMethod: paymentMethod,
      ),
    );
  }

  Future<void> placeOrder() async {
    emit(CheckoutLoading());

    // Add order validation and order creation here.

    await Future.delayed(const Duration(seconds: 1));

    emit(CheckoutSuccess('Order placed successfully'));
  }
}