import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/home/widget/product_cart.dart';


class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Popular products',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorManager.textColor,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: ColorManager.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          childAspectRatio: 0.84,
          children: const [
            ProductCard(
              name: 'Wireless Headphones',
              price: '\$89.00',
              rating: '4.8',
              imageUrl:
                  'assets/images/head_phones.png',
            ),
            ProductCard(
              name: 'Smart Watch',
              price: '\$129.00',
              rating: '4.9',
              imageUrl:
                  'assets/images/watch.png',
            ),
            ProductCard(
              name: 'IPhone 17',
              price: '\$699.00',
              rating: '4.7',
              imageUrl:
                  'assets/images/iphone.png',
            ),
          ],
        ),
      ],
    );
  }
}