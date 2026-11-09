import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 7),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? ColorManager.primaryColor
            : Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: isSelected
            ? null
            : Border.all(color: ColorManager.borderColor),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : ColorManager.greyColor,
        ),
      ),
    );
  }
}