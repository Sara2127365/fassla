import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/checkout/app_card.dart';


class DeliveryAddressCard extends StatelessWidget {
  final String label;
  final String nameAndPhone;
  final String street;
  final String city;
  final VoidCallback? onEdit;

  const DeliveryAddressCard({
    super.key,
    required this.label,
    required this.nameAndPhone,
    required this.street,
    required this.city,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: ColorManager.primaryColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color:ColorManager.textColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  nameAndPhone,
                  style: const TextStyle(
                    color: ColorManager.greyColor,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  street,
                  style: const TextStyle(
                    color: ColorManager.textColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  city,
                  style: const TextStyle(
                    color: ColorManager.textColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onEdit,
            child: const Text(
              'Edit',
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