import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_theme.dart';
import 'package:food_delivery_app/core/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import 'Features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const FoodApp(),
    ),
  );
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>( // Use Consumer to access theme
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          home: const SplashView(),
        );
      },
    );
  }
}