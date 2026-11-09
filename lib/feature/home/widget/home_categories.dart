
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task1fassla/core/style/color_manager.dart';
import 'package:task1fassla/feature/home/cubit/home_cubit.dart';
import 'package:task1fassla/feature/home/cubit/home_state.dart';

import 'category_item.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorManager.textColor,
              ),
            ),
            const SizedBox(height: 9),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: state.categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<HomeCubit>()
                          .selectCategory(category);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CategoryItem(
                        title: category,
                        isSelected:
                            state.selectedCategory == category,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
