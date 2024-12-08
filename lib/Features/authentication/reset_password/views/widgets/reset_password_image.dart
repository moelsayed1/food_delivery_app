import 'package:flutter/material.dart';
import 'package:food_delivery_app/generated/assets.dart';

class ResetPasswordImage extends StatelessWidget {
  const ResetPasswordImage({
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
          image: AssetImage(
            Assets.imagesResetPassword,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}