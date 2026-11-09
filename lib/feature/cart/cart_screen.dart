
import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/core/widgets/app_custom_bar.dart';
import 'package:task1fassla/feature/cart/cart_item_card.dart';
import 'package:task1fassla/feature/cart/models/cart_item.dart';
import 'package:task1fassla/feature/cart/widget/cart_summary.dart';
import 'package:task1fassla/feature/cart/widget/check_out_button.dart';
import 'package:task1fassla/feature/cart/widget/promo_code_field.dart';
import 'package:task1fassla/feature/checkout/check_out_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  static const double _deliveryFee = 8.00;

  final _promoController = TextEditingController();

  final List<CartItem> _items = [
    CartItem(
      name: 'Wireless Headphones',
      price: 89.00,
      imagePath: 'assets/images/head_phone.png',
      quantity: 1,
    ),
    CartItem(
      name: 'Smart Watch',
      price: 129.00,
      imagePath: 'assets/images/watch.png',
      quantity: 1,
    ),
  ];

  int get _itemsCount =>
      _items.fold(0, (sum, item) => sum + item.quantity);

  double get _subtotal =>
      _items.fold(0.0, (sum, item) => sum + item.price * item.quantity);

  void _increment(CartItem item) {
    setState(() => item.quantity++);
  }

  void _decrement(CartItem item) {
    if (item.quantity > 1) {
      setState(() => item.quantity--);
    }
  }

  void _delete(CartItem item) {
    setState(() => _items.remove(item));
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,

      appBar: const AppCustomBar(
        title: 'My Cart',
        
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                children: [
                  Text(
                    '$_itemsCount items in your bag',
                    style: const TextStyle(
                      fontSize: 13,
                      color: ColorManager.textColor,
                    ),
                  ),
                  const SizedBox(height: 12),

                  for (final item in _items) ...[
                    CartItemCard(
                      item: item,
                      onIncrement: () => _increment(item),
                      onDecrement: () => _decrement(item),
                      onDelete: () => _delete(item),
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
                    subtotal: _subtotal,
                    delivery: _deliveryFee,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: CheckoutButton(
                onPressed: _items.isEmpty
                    ? null
                    : () {
                        Navigator.pushReplacement(
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
        ),
      ),
    );
  }
}
