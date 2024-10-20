import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';
import 'package:food_delivery_app/core/utils/custom_text_field/custom_text_field.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/generated/assets.dart';

class ForgetViewBody extends StatefulWidget {
  const ForgetViewBody({super.key});

  @override
  State<ForgetViewBody> createState() => _ForgetViewBodyState();
}

class _ForgetViewBodyState extends State<ForgetViewBody> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarIcons(),
            const SizedBox(
              height: 120,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(Assets.imagesForgetPassword),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text(
                'Forget Password ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Don\'t worry, it happens to the best of us.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: emailController,
              labelText: 'Email',
              hintText: 'Enter Your Email',
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              width: 200,
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.otpRoute);
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


