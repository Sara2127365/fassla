import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';

class AppHomeHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onCartTap;

  const AppHomeHeader({
    super.key,
    this.title = 'Discover',
    this.subtitle = "Find something you'll love",
    this.onCartTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: ColorManager.textColor,
              ),
            ),
            IconButton(
              onPressed: onCartTap,
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.greyColor,
                size: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: ColorManager.greyColor,
          ),
        ),
      ],
    );
  }
}