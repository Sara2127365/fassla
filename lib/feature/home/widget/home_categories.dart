import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';

import 'category_item.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: const [
              CategoryItem(title: 'All', isSelected: true),
              CategoryItem(title: 'Tech', isSelected: false),
              CategoryItem(title: 'Fashion', isSelected: false),
              CategoryItem(title: 'Home', isSelected: false),
            ],
          ),
        ),
      ],
    );
  }
}