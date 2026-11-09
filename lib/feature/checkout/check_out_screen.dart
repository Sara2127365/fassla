import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/checkout/checkout_stepper.dart';
import 'package:task1fassla/feature/checkout/delivery_address_card.dart';
import 'package:task1fassla/feature/checkout/order_summary_card.dart';
import 'package:task1fassla/feature/checkout/payment_method_section.dart';
import 'package:task1fassla/feature/checkout/place_order_button.dart';
import 'package:task1fassla/feature/checkout/section_title.dart';
import 'package:task1fassla/feature/orders/order_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentMethod _payment = PaymentMethod.cash;

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
              const CheckoutStepper(currentStep: 2),
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
                    PaymentMethodSection(
                      selected: _payment,
                      onChanged: (value) {
                        setState(() {
                          _payment = value;
                        });
                      },
                    ),
                    const SizedBox(height: 22),
                    const SectionTitle('Order summary'),
                    const OrderSummaryCard(
                      itemsCount: 3,
                      itemsTotal: 218.00,
                      deliveryFee: 8.00,
                    ),
                    const SizedBox(height: 20),
                    PlaceOrderButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,   MaterialPageRoute(
              builder: (context) => const OrderConfirmationScreen(),
            ),);
                      },
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
