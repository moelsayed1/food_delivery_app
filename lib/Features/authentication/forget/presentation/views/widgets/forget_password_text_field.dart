import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/custom_text_field/custom_text_field.dart';

class ForgetPasswordTextField extends StatelessWidget {
  const ForgetPasswordTextField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter this filed';
        }
        return null;
      },
      controller: emailController,
      labelText: 'Email',
      hintText: 'Enter Your Email',
      keyboardType: TextInputType.emailAddress,
    );
  }
}