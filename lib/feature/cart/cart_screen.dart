
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/core/widgets/app_custom_bar.dart';
import 'package:task1fassla/feature/cart/cart_item_card.dart';
import 'package:task1fassla/feature/cart/cubit/cart_cubit.dart';
import 'package:task1fassla/feature/cart/cubit/cart_state.dart';
import 'package:task1fassla/feature/cart/widget/cart_summary.dart';
import 'package:task1fassla/feature/cart/widget/check_out_button.dart';
import 'package:task1fassla/feature/cart/widget/promo_code_field.dart';
import 'package:task1fassla/feature/checkout/check_out_screen.dart';
import 'package:task1fassla/feature/home/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  static const double _deliveryFee = 8.00;

  final TextEditingController _promoController =
      TextEditingController();

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,

      appBar: AppCustomBar(
        title: 'My Cart',
        showBackButton: true,
        onBackPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      ),

      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartInitial || state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CartError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is CartLoaded) {
            final items = state.items;

            if (items.isEmpty) {
              return Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Your cart is empty',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorManager.textColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20, 8, 20, 20,
                    ),
                    child: CheckoutButton(
                      onPressed: null,
                    ),
                  ),
                ],
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(
                      20, 12, 20, 20,
                    ),
                    children: [
                      Text(
                        '${state.totalItems} items in your bag',
                        style: const TextStyle(
                          fontSize: 13,
                          color: ColorManager.textColor,
                        ),
                      ),

                      const SizedBox(height: 12),

                      for (int index = 0;
                          index < items.length;
                          index++) ...[
                        CartItemCard(
                          item: items[index],

                          onIncrement: () {
                            context.read<CartCubit>().increment(index);
                          },

                          onDecrement: () {
                            context.read<CartCubit>().decrement(index);
                          },

                          onDelete: () {
                            context.read<CartCubit>().removeItem(index);
                          },
                        ),

                        const SizedBox(height: 12),
                      ],

                      const SizedBox(height: 16),

                      PromoCodeField(
                        controller: _promoController,
                        onApply: () {
                          // TODO: Apply promo code
                        },
                      ),

                      const SizedBox(height: 20),

                      CartSummary(
                        subtotal: state.subtotal,
                        delivery: _deliveryFee,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20, 8, 20, 20,
                  ),
                  child: CheckoutButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CheckoutScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
