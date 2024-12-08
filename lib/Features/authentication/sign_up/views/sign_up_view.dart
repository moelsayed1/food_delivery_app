import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/sign_up/views/widgets/sign_up_view_body.dart';
import 'package:food_delivery_app/generated/assets.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
        child: const SignUpViewBody(),
      ),
    );
  }
}
