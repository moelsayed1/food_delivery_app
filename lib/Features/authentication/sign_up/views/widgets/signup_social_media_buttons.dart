// signup_social_media_buttons.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/Features/authentication/sign_up/manager/signup_cubit.dart';
import 'package:food_delivery_app/generated/assets.dart';

class SignupSocialMediaButtons extends StatelessWidget {
  const SignupSocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
            width: 160,
            child: ElevatedButton.icon(
              onPressed: () async {
                context.read<SignupCubit>().signUpOrSignInWithFacebook();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1877F2)),
              label: const Text('Facebook', style: TextStyle(fontSize: 16)),
              icon: Image.asset(Assets.imagesLogoFacebook, height: 30),
            ),
          ),
          SizedBox(
            height: 50,
            width: 160,
            child: ElevatedButton.icon(
              onPressed: () => context.read<SignupCubit>().signInWithGoogle(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              label: Text('Google',
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.5))),
              icon: Image.asset(Assets.imagesLogoGoogle, height: 25),
            ),
          ),
        ],
      ),
    );
  }
}
