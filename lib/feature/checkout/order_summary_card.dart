import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/checkout/checkout_stepper.dart';
import 'package:task1fassla/feature/checkout/cubit/check_out_cubit.dart';
import 'package:task1fassla/feature/checkout/cubit/check_out_state.dart';
import 'package:task1fassla/feature/checkout/place_order_button.dart';
import 'package:task1fassla/feature/checkout/section_title.dart';
import 'package:task1fassla/feature/orders/order_screen.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  static const int itemsCount = 3;
  static const double itemsTotal = 218.00;
  static const double deliveryFee = 8.00;

  double get total => itemsTotal + deliveryFee;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutSuccess) {
          // FIX: Capture the current cubit instance
          final checkoutCubit = context.read<CheckoutCubit>();
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              // FIX: Provide the cubit to the new route using BlocProvider.value
              builder: (context) => BlocProvider.value(
                value: checkoutCubit,
                child: const OrderConfirmationScreen(),
              ),
            ),
          );
        }

        if (state is CheckoutError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 20),
            color: ColorManager.textColor,
            onPressed: () => Navigator.maybePop(context),
          ),
          titleSpacing: 0,
          title: const Text(
            'Order Summary',
            style: TextStyle(
              color: ColorManager.textColor,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CheckoutStepper(currentStep: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle('Order summary'),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorManager.borderColor,
                          ),
                        ),
                        child: Column(
                          children: [
                            _summaryRow(
                              'Items ($itemsCount)',
                              '\$${itemsTotal.toStringAsFixed(2)}',
                            ),
                            const SizedBox(height: 12),
                            _summaryRow(
                              'Delivery fee',
                              '\$${deliveryFee.toStringAsFixed(2)}',
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              child: Divider(
                                height: 1,
                                color: ColorManager.borderColor,
                              ),
                            ),
                            _summaryRow(
                              'Total',
                              '\$${total.toStringAsFixed(2)}',
                              isTotal: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      BlocBuilder<CheckoutCubit, CheckoutState>(
                        builder: (context, state) {
                          return PlaceOrderButton(
                            onPressed: state is CheckoutLoading
                                ? null
                                : () {
                                    context
                                        .read<CheckoutCubit>()
                                        .placeOrder();
                                  },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 17 : 14,
            fontWeight: isTotal ? FontWeight.w800 : FontWeight.w400,
            color: isTotal
                ? ColorManager.textColor
                : ColorManager.greyColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 20 : 14,
            fontWeight: FontWeight.w800,
            color: ColorManager.textColor,
          ),
        ),
      ],
    );
  }
}