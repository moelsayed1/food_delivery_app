import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/themes/app_theme.dart';
import 'package:flutter/widgets.dart';

class ResetSuccessfulViewBody extends StatelessWidget {
  const ResetSuccessfulViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const AppBarIcons(),
            const SizedBox(
              height: 100,
            ),
            CircleAvatar(
              radius: 60.r,
              backgroundColor: AppTheme.darkTheme.primaryColor.withOpacity(0.2),
              child:  Icon(
                Icons.check,
                size: 60.r,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: const Text(
                'Reset Successful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'You can now login to your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 60,
              width: 200,
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.loginRoute);
                },
                child: const Text(
                  'Login Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
