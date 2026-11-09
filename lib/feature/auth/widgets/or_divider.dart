// Karim Toson || kareemtoson1@gmail.com || Tue Apr 28 2026 18:53:48

import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';



class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, ColorManager.greyColor],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            Text(
              "Or continue with",
              style: TextStyle(color: ColorManager.greyColor),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ColorManager.greyColor, Colors.transparent],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/google.png'),
            SizedBox(width: 15),

            Image.asset('assets/facebook.png'),
            SizedBox(width: 15),

            Image.asset('assets/apple.png'),
          ],
        ),
      ],
    );
  }
}