import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';
import 'package:food_delivery_app/core/utils/custom_text_field/custom_text_field.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/themes/app_theme.dart';
import 'package:food_delivery_app/generated/assets.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarIcons(),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'Enter Your Email',
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // Use TextFormField for obscureText and suffixIcon
                  controller: passwordController,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    border: AppTheme.darkTheme.inputDecorationTheme.border,
                    enabledBorder:
                        AppTheme.darkTheme.inputDecorationTheme.enabledBorder,
                    focusedBorder:
                        AppTheme.darkTheme.inputDecorationTheme.focusedBorder,
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.forgetRoute);
                    },
                    child: Text('Forget Password?',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.darkTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: SizedBox(
                    height: 55,
                    width: 200,
                    child: CustomElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.signupRoute);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffFF5722),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Sign Up with',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 160,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1877F2),
                          ),
                          label: const Text(
                            'Facebook',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          icon: Image.asset(
                            Assets.imagesLogoFacebook,
                            height: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 160,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          label: Text(
                            'Google',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          icon: Image.asset(
                            Assets.imagesLogoGoogle,
                            height: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
