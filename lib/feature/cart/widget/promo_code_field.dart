import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/cart/cart_item_card.dart';

class PromoCodeField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onApply;

  const PromoCodeField({
    super.key,
    required this.controller,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ColorManager.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 14, color: ColorManager.textColor),
              decoration: const InputDecoration(
                hintText: 'Promo code',
                hintStyle: TextStyle(color: ColorManager.greyColor, fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          TextButton(
            onPressed: onApply,
            child: const Text(
              'Apply',
              style: TextStyle(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------- 4) Order summary ----------


/// ---------- 5) Checkout button ----------
