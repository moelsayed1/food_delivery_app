import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/themes/app_theme.dart';


class LoginTextFields extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscureText;
  final VoidCallback onObscureTextPressed;

  const LoginTextFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.obscureText,
    required this.onObscureTextPressed,

  });

  @override
  State<LoginTextFields> createState() => _LoginTextFieldsState();
}



class _LoginTextFieldsState extends State<LoginTextFields> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
          controller: widget.emailController, // Use widget.emailController
          decoration: InputDecoration(
            border: AppTheme.darkTheme.inputDecorationTheme.border,
            enabledBorder: AppTheme.darkTheme.inputDecorationTheme.enabledBorder,
            focusedBorder: AppTheme.darkTheme.inputDecorationTheme.focusedBorder,

            labelText: 'Email',
            hintText: 'Enter Your Email',
          ),
          keyboardType: TextInputType.emailAddress,

        ),
        const SizedBox(height: 20),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          controller: widget.passwordController,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            border: AppTheme.darkTheme.inputDecorationTheme.border,
            enabledBorder: AppTheme.darkTheme.inputDecorationTheme.enabledBorder,
            focusedBorder: AppTheme.darkTheme.inputDecorationTheme.focusedBorder,
            labelText: 'Password',
            suffixIcon: IconButton(
              onPressed: widget.onObscureTextPressed,
              icon: Icon(
                widget.obscureText ? Icons.visibility_off : Icons.visibility,

              ),
            ),
          ),

        ),
      ],
    );
  }
}