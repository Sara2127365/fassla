import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry padding;

  const AppCard({
    super.key,
    required this.child,
    this.borderColor =ColorManager.borderColor,
    this.borderWidth = 1,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: child,
    );
  }
}