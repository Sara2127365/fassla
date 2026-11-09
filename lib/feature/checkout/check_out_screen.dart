
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/checkout/checkout_stepper.dart';
import 'package:task1fassla/feature/checkout/cubit/check_out_cubit.dart';
import 'package:task1fassla/feature/checkout/cubit/check_out_state.dart';
import 'package:task1fassla/feature/checkout/delivery_address_card.dart';
import 'package:task1fassla/feature/checkout/payment_method_section.dart';
import 'package:task1fassla/feature/checkout/section_title.dart';
import 'package:task1fassla/feature/checkout/order_summary_card.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: const CheckoutView(),
    );
  }
}

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
          color: ColorManager.textColor,
          onPressed: () => Navigator.maybePop(context),
        ),
        titleSpacing: 0,
        title: const Text(
          'Checkout',
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
              const CheckoutStepper(currentStep: 1),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle('Delivery address'),

                    DeliveryAddressCard(
                      label: 'Home',
                      nameAndPhone: 'Alex Morgan · +1 555 010 234',
                      street: '42 Park Avenue, Apt 5B',
                      city: 'New York, NY 10016',
                      onEdit: () {},
                    ),

                    const SizedBox(height: 22),

                    const SectionTitle('Payment method'),

                    BlocBuilder<CheckoutCubit, CheckoutState>(
                      builder: (context, state) {
                        final cubit = context.read<CheckoutCubit>();

                        final selectedPayment =
                            state is CheckoutFormUpdated
                                ? state.paymentMethod
                                : cubit.paymentMethod;

                        return PaymentMethodSection(
                          selected: selectedPayment,
                          onChanged: cubit.updatePaymentMethod,
                        );
                      },
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: context.read<CheckoutCubit>(),
                                child: const OrderSummarySection(),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
