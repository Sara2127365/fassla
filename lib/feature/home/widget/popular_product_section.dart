
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/home/cubit/home_cubit.dart';
import 'package:task1fassla/feature/home/cubit/home_state.dart';
import 'package:task1fassla/feature/home/widget/product_cart.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) {
          return const SizedBox.shrink();
        }

        final products = state.filteredProducts;

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
            if (products.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'No products found',
                    style: TextStyle(
                      color: ColorManager.greyColor,
                    ),
                  ),
                ),
              )
            else
              GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.84,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductCard(
                    name: product.name,
                    price: product.price,
                    rating: product.rating,
                    imagePath: product.imagePath,
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
