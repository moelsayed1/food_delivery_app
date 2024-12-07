import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/login/views/widgets/login_view_body.dart';
import 'package:food_delivery_app/generated/assets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; // Import ModalProgressHUD

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(Assets.imagesBackground),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: const LoginViewBody(),
        ),
      ),
    );
  }
}