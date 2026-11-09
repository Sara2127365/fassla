import 'package:flutter/material.dart';
import 'package:task1fassla/core/style/color_manager.dart';

class CheckoutStepper extends StatelessWidget {
  final int currentStep;

  const CheckoutStepper({
    super.key,
    this.currentStep = 2,
  });

  @override
  Widget build(BuildContext context) {
    const labels = ['Cart', 'Checkout', 'Done'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _step(1, labels[0]),
          _line(),
          _step(2, labels[1]),
          _line(),
          _step(3, labels[2]),
        ],
      ),
    );
  }

  Widget _step(int number, String label) {
    final bool active = number <= currentStep;

    return SizedBox(
      width: 56,
      child: Column(
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? ColorManager.primaryColor : Colors.white,
              border: Border.all(
                color: active
                    ?ColorManager.primaryColor
                    : ColorManager.borderColor,
                width: 1.5,
              ),
            ),
            child: Text(
              '$number',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: active
                    ? Colors.white
                    : ColorManager.greyColor,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: number == currentStep
                  ? FontWeight.w700
                  : FontWeight.w400,
              color: number == currentStep
                  ? ColorManager.primaryColor
                  : ColorManager.greyColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _line() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 13),
        child: Container(
          height: 2,
          color: ColorManager.borderColor,
        ),
      ),
    );
  }
}