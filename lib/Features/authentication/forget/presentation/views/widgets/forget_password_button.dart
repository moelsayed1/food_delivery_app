import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/widgets/show_snack_bar.dart';

import 'forget_view_body.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
    required this.formKey,
    required this.widget,
    required this.emailController, this.onPressed,
  });

  final GlobalKey<FormState> formKey;
  final ForgetViewBody widget;
  final TextEditingController emailController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 200,
      child: CustomElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {  // Validate before proceeding
            widget.onLoadingChanged(true); // Show Loading Indicator
            try {
              await FirebaseAuth.instance.sendPasswordResetEmail(
                  email: emailController.text.trim());
              buildShowSnackBar(context,
                  'Password reset email sent. Check your inbox');
              Navigator.pushNamed(context, AppRouter.resetRoute); // Navigate back after success
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                buildShowSnackBar(
                    context, 'No user found for that email.');
              } else if (e.code == 'invalid-email') {
                buildShowSnackBar(context, 'Invalid email format.');
              } else {
                buildShowSnackBar(context, 'Error sending reset email: ${e.message}');
              }
            } finally {
              widget.onLoadingChanged(false); // Hide Loading Indicator
            }
          }
        },
        child: const Text(
          'Continue',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}