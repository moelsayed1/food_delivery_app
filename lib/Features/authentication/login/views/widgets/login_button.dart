import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 55,
        width: 200,
        child: CustomElevatedButton(
          onPressed: onPressed,
          child: const Text('Login', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}