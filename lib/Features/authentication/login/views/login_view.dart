import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/login/views/widgets/login_view_body.dart';
import 'package:food_delivery_app/generated/assets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: const SizedBox.expand( // Use SizedBox.expand to fill available space
          child: Column(
            children: [
              Expanded( // Push SignUpViewBody to the top
                child: LoginViewBody(),
              ),
              // Add some bottom spacing if needed
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
