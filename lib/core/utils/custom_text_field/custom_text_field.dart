import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/themes/app_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obsecureText = false,
    this.validator,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final String labelText;
  final bool obsecureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: AppTheme.darkTheme.inputDecorationTheme.border,
        enabledBorder: AppTheme.darkTheme.inputDecorationTheme.enabledBorder,
        focusedBorder: AppTheme.darkTheme.inputDecorationTheme.focusedBorder,
      ),
    );
  }
}

// OutlineInputBorder buildOutlineInputBorder() {
//   return OutlineInputBorder(
//     borderSide: BorderSide(
//       color: Colors.white.withOpacity(0.5),
//     ),
//     borderRadius: BorderRadius.circular(25),
//   );
// }
