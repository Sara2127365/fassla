
import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/cart/models/cart_item.dart';
import 'package:task1fassla/feature/cart/widget/quantity_stepper.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorManager.borderColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 72,
            height: 72,
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.image_outlined,
                size: 40,
                color: ColorManager.greyColor,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: ColorManager.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${item.numericPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: ColorManager.primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                QuantityStepper(
                  quantity: item.quantity,
                  onIncrement: item.quantity < 100
                      ? onIncrement
                      : () {},
                  onDecrement: onDecrement,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onDelete,
            child: const Icon(
              Icons.delete_outline,
              size: 22,
              color: ColorManager.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
