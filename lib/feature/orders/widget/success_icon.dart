import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 190,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _circle(170, ColorManager.greenLighter),
          _circle(120, ColorManager.greenLight),
          _circle(80, ColorManager.green),
          const Icon(Icons.check, color: Colors.white, size: 48),
          // decorative dots
          _dot(left: 22, top: 40, size: 10, color:ColorManager.greenLight ),
          _dot(right: 14, top: 30, size: 14, color: ColorManager.greenLight),
          _dot(right: 34, bottom: 28, size: 8, color:ColorManager.greenLight ),
          const Positioned(
            left: 30,
            bottom: 50,
            child: Icon(Icons.close, size: 12, color: ColorManager.green),
          ),
        ],
      ),
    );
  }

  Widget _circle(double size, Color color) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );

  Widget _dot({
    double? left,
    double? right,
    double? top,
    double? bottom,
    required double size,
    required Color color,
  }) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

