import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';

class OrderDetailsCard extends StatelessWidget {
  final String orderNumber;
  final String estimatedDelivery;
  final double totalPaid;

  const OrderDetailsCard({
    super.key,
    required this.orderNumber,
    required this.estimatedDelivery,
    required this.totalPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ORDER DETAILS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
              color: ColorManager.greyColor,
            ),
          ),
          const SizedBox(height: 12),
          _row('Order number', orderNumber),
          _divider(),
          _row('Estimated delivery', estimatedDelivery),
          _divider(),
          _row(
            'Total paid',
            '\$${totalPaid.toStringAsFixed(2)}',
            valueSize: 20,
            valueWeight: FontWeight.w800,
          ),
        ],
      ),
    );
  }

  Widget _row(
    String label,
    String value, {
    double valueSize = 14,
    FontWeight valueWeight = FontWeight.w700,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: ColorManager.greyColor),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: valueSize,
              fontWeight: valueWeight,
              color: ColorManager.textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => const Divider(height: 1, color: ColorManager.borderColor);
}