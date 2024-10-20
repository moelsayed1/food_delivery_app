import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/forget/views/forget_password_view.dart';
import 'package:food_delivery_app/Features/authentication/login/views/login_view.dart';
import 'package:food_delivery_app/Features/authentication/otp/views/otp_view.dart';
import 'package:food_delivery_app/Features/authentication/sign_up/views/sign_up_view.dart';
import 'package:food_delivery_app/Features/home/presentation/views/home_view.dart';
import 'package:food_delivery_app/Features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String forgetRoute = '/forget';
  static const String otpRoute = '/otp';
  static const String homeRoute = '/home';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case loginRoute:
        return MaterialPageRoute(builder: (_) =>  const LoginView());
      case signupRoute:
        return MaterialPageRoute(builder: (_) =>  const SignUpView());
      case forgetRoute:
        return MaterialPageRoute(builder: (_) =>  const ForgetPasswordView());
      case otpRoute:
        return MaterialPageRoute(builder: (_) =>  const OtpView());
      case homeRoute:
        return MaterialPageRoute(builder: (_) =>  const HomeView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
