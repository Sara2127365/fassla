import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';

class PlaceOrderButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PlaceOrderButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton.icon(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: const Icon(Icons.check, size: 20),
            label: const Text(
              'Place Order',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Secure and encrypted checkout',
          style: TextStyle(
            color:ColorManager.greyColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
