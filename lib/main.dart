import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/themes/app_theme.dart';
import 'Features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(
    const FoodApp(),
  );
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashView(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
