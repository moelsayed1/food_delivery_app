import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/custom_text_field/custom_text_field.dart';
import 'package:food_delivery_app/core/utils/themes/app_theme.dart';

class SignupTextFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscureText;
  final VoidCallback onObscureTextPressed;


  const SignupTextFields({
    super.key, required this.nameController, required this.emailController, required this.passwordController, required this.obscureText, required this.onObscureTextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: nameController,
          labelText: 'Full Name',
          hintText: 'Enter Your Full Name',
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your full name';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: emailController,
          labelText: 'Email',
          hintText: 'Enter Your Email',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),

        TextFormField( // Use TextFormField directly here for obscureText
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            return null; // Add other validation as needed
          },
          controller: passwordController,
          obscureText: obscureText, // Use obscureText property
          decoration:  InputDecoration(
            border: AppTheme.darkTheme.inputDecorationTheme.border,
            enabledBorder: AppTheme.darkTheme.inputDecorationTheme.enabledBorder,
            focusedBorder: AppTheme.darkTheme.inputDecorationTheme.focusedBorder,
            labelText: 'Password',

            suffixIcon: IconButton( // IconButton for obscureText toggle
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: onObscureTextPressed,
            ),
          ),
        ),

      ],
    );
  }
}