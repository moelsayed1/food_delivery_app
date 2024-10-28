import 'package:flutter/material.dart';

class AppTheme {
  static const Color orangeColor = Color(0xFFF9813A);
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepOrange,
    visualDensity: VisualDensity.compact,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: Colors.white70),
      hintStyle: const TextStyle(color: Colors.white54),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white54),
        borderRadius: BorderRadius.circular(25.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white54),
        borderRadius: BorderRadius.circular(25.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.deepOrange),
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );
}