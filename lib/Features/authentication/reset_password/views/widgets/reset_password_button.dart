import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 200,
      child: CustomElevatedButton(
        onPressed: onPressed,
        child: const Text(
          'Reset Password',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}