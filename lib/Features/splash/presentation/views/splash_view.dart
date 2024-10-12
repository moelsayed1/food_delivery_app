import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/splash/presentation/views/splash_view_body.dart';
import 'package:food_delivery_app/core/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // ... your app content

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffF34A23),
        onPressed: () {
          themeProvider.toggleTheme();
        },
        child: Icon(
          themeProvider.themeMode == ThemeMode.light
              ? Icons.dark_mode
              : Icons.light_mode,
        ),
      ),
      body: const SplashViewBody(),
    );
  }
}
