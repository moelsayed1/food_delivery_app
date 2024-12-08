import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/custom_text_field/custom_text_field.dart';

class ResetPasswordTextFields extends StatelessWidget {
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final bool obscureText;
  final VoidCallback toggleObscureText;

  const ResetPasswordTextFields({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.obscureText,
    required this.toggleObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: newPasswordController,
          labelText: 'New Password',
          hintText: 'New Password',
          obsecureText: obscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: toggleObscureText,
          ),
        ),
        const SizedBox(height: 16.0),
        CustomTextField(
          controller: confirmPasswordController,
          labelText: 'Confirm Password',
          hintText: 'Confirm Password',
          obsecureText: obscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != newPasswordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: toggleObscureText,
          ),
        ),
      ],
    );
  }
}
