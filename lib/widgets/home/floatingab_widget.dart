import 'package:flutter/material.dart';
import 'package:ration_now/utils/utils.dart';

class FloatingAButton extends StatelessWidget {
  const FloatingAButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cartItem = 1;
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Badge(
        isLabelVisible: cartItem > 0 ? true : false,
        label: Text("$cartItem"),
        child: const Icon(
          Icons.shopping_cart,
          size: 36,
          color: Colors.white,
        ),
      ),
    );
  }
}
