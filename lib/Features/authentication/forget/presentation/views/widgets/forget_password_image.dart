import 'package:flutter/material.dart';
import 'package:food_delivery_app/generated/assets.dart';

class ForgetPasswordImage extends StatelessWidget {
  const ForgetPasswordImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(Assets.imagesForgetPassword),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}