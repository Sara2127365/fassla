import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/home/home_screen.dart';
import 'package:task1fassla/feature/orders/widget/confirmations_button.dart';
import 'package:task1fassla/feature/orders/widget/order_details_card.dart';
import 'package:task1fassla/feature/orders/widget/success_icon.dart';
import 'package:task1fassla/feature/orders/widget/success_message.dart';


class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          color: ColorManager.textColor,
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const HomeScreen(),)),
        ),
        titleSpacing: 0,
        title: const Text(
          'Order confirmation',
          style: TextStyle(
            color: ColorManager.textColor,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: Column(
            children: [
              const SuccessIcon(),
              const SizedBox(height: 20),
              const SuccessMessage(
                title: 'Order placed successfully!',
                message:
                    'Your order is confirmed and on its way to being prepared.',
              ),
              const SizedBox(height: 28),
              const OrderDetailsCard(
                orderNumber: '#ORD-28491',
                estimatedDelivery: 'Nov 11 – 13',
                totalPaid: 226.00,
              ),
              const SizedBox(height: 32),
              ConfirmationButtons(
                onTrackOrder: () {},
                onContinueShopping: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
