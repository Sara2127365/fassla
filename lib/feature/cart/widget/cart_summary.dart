import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/cart/cart_item_card.dart';

class CartSummary extends StatelessWidget {
  final double subtotal;
  final double delivery;

  const CartSummary({
    super.key,
    required this.subtotal,
    required this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    final total = subtotal + delivery;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order summary',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: ColorManager.textColor,
          ),
        ),
        const SizedBox(height: 14),
        _row('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
        const SizedBox(height: 10),
        _row('Delivery', '\$${delivery.toStringAsFixed(2)}'),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Divider(height: 1, color: ColorManager.borderColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: ColorManager.textColor,
              ),
            ),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: ColorManager.textColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _row(String label, String value) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 14, color: ColorManager.greyColor)),
          Text(value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: ColorManager.textColor,
              )),
        ],
      );
}