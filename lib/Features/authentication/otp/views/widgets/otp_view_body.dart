import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';
import 'package:food_delivery_app/core/utils/themes/app_theme.dart';
import 'package:food_delivery_app/generated/assets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  TextEditingController otpController = TextEditingController();

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
                  height: 100,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.imagesAnimationMail,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text(
                    'Check your mail',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'We just sent an OTP code to your registered email address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeColor: AppTheme.darkTheme.primaryColor,
                    inactiveColor: Colors.grey,
                    selectedColor: Colors.white.withOpacity(0.5),
                  ),
                  onChanged: (value) {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '00:',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Countdown(
                      seconds: 20,
                      build: (_, double time) => Text(
                        time.toInt().toString().padLeft(2, '0'),
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      interval: const Duration(milliseconds: 100),
                      onFinished: () {
                        // Handle countdown finished (e.g., show resend option)
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Handle resend OTP logic
                  },
                  child: Text(
                    'I don\'t receive a code! Please resend',
                    style: TextStyle(
                      color: AppTheme.darkTheme.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // "Verify OTP" Button
                SizedBox(
                  height: 60,
                  width: 200,
                  child: CustomElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Verify OTP',
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



