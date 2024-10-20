import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';
import 'package:food_delivery_app/core/utils/custom_text_field/custom_text_field.dart';
import 'package:food_delivery_app/generated/assets.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppBarIcons(),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.imagesResetPassword,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Reset your password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'Here\'s a tip: Use a combination of\nNumbers, Uppercase, lowercase and\nSpecial characters',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                CustomTextField(
                  controller: passwordController,
                  labelText: 'New Password',
                  hintText: 'New Password',
                  obsecureText: true,
                ),
                const SizedBox(height: 32.0),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: CustomElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Reset Password',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
