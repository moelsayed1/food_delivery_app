import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/forget/presentation/views/forget_password_view.dart';
import 'package:food_delivery_app/Features/authentication/login/views/login_view.dart';
import 'package:food_delivery_app/Features/authentication/otp/views/otp_view.dart';
import 'package:food_delivery_app/Features/authentication/reset_password/views/reset_password_view.dart';
import 'package:food_delivery_app/Features/authentication/reset_successful/views/reset_successful_view.dart';
import 'package:food_delivery_app/Features/authentication/sign_up/views/sign_up_view.dart';
import 'package:food_delivery_app/Features/cart/presentation/views/cart_view.dart';
import 'package:food_delivery_app/Features/favorites/views/favorite_view.dart';
import 'package:food_delivery_app/Features/home/presentation/views/food_details_view.dart';
import 'package:food_delivery_app/Features/home/presentation/views/home_view.dart';
import 'package:food_delivery_app/Features/order/presentation/views/order_view.dart';
import 'package:food_delivery_app/Features/profile/views/profile_view.dart';
import 'package:food_delivery_app/Features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String forgetRoute = '/forget';
  static const String otpRoute = '/otp';
  static const String resetRoute = '/reset';
  static const String resetSuccessRoute = '/reset_success';
  static const String homeRoute = '/home';
  static const String foodDetailsRoute = '/food_details';
  static const String ordersRoute = '/orders';
  static const String cartRoute = '/cart';
  static const String favoritesRoute = '/favorites';
  static const String profileRoute = '/profile';


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
      case resetRoute:
        return MaterialPageRoute(builder: (_) =>  const ResetPasswordView());
      case resetSuccessRoute:
        return MaterialPageRoute(builder: (_) =>  const ResetSuccessfulView());
      case homeRoute:
        return MaterialPageRoute(builder: (_) =>  const HomeView());
      case foodDetailsRoute:
        return MaterialPageRoute(builder: (_) =>  const FoodDetailsView());
      case ordersRoute:
        return MaterialPageRoute(builder: (_) =>  const OrderView());
      case cartRoute:
        return MaterialPageRoute(builder: (_) =>  const CartView());
      case favoritesRoute:
        return MaterialPageRoute(builder: (_) =>  const FavoriteView());
      case profileRoute:
        return MaterialPageRoute(builder: (_) =>  const ProfileView());
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
