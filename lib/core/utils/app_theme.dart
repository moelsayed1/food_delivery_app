import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue, // Customize your light theme colors
    // ...other light theme properties
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xffF34A23), // Customize your dark theme colors
    // ...other dark theme properties
  );
}