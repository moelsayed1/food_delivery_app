import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 55,
        width: 200,
        child: CustomElevatedButton(
          onPressed: onPressed,
          child: const Text('SIGN UP', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}