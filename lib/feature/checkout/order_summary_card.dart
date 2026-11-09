import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/checkout/app_card.dart';

class OrderSummaryCard extends StatelessWidget {
  final int itemsCount;
  final double itemsTotal;
  final double deliveryFee;

  const OrderSummaryCard({
    super.key,
    required this.itemsCount,
    required this.itemsTotal,
    required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    final total = itemsTotal + deliveryFee;

    return AppCard(
      child: Column(
        children: [
          _row(
            'Items ($itemsCount)',
            '\$${itemsTotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 10),
          _row(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: ColorManager.textColor,
                ),
              ),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: ColorManager.textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: ColorManager.greyColor,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: ColorManager.textColor,
          ),
        ),
      ],
    );
  }
}