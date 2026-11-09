import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';

class SuccessMessage extends StatelessWidget {
  final String title;
  final String message;

  const SuccessMessage({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: ColorManager.textColor,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
              color: ColorManager.greyColor,
            ),
          ),
        ),
      ],
    );
  }
}