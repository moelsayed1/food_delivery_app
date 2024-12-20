import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/AuthenticationController.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';
import 'package:food_delivery_app/core/utils/custom_text_field/custom_text_field.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/themes/app_theme.dart';
import 'package:food_delivery_app/core/utils/widgets/show_snack_bar.dart';
import 'package:food_delivery_app/generated/assets.dart';
import 'package:get/get.dart';

class SignUpv2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => autController());
    autController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: controller.formKey,
        child: SafeArea(
          child: ListView(
            children: [
              controller.isLoading
                  ? const CircularProgressIndicator.adaptive()
                  : GetBuilder<autController>(
                      init: autController(),
                      builder: (controller) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppBarIcons(),
                          const SizedBox(
                            height: 100,
                          ),
                          const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextField(
                            onChanged: (value) {
                              controller.name = value;
                            },
                            hintText: 'Enter Your Full Name',
                            labelText: 'Full Name',
                            keyboardType: TextInputType.name,
                            controller: controller.nameController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            onChanged: (value) {
                              controller.email = value;
                            },
                            hintText: 'Enter Your Email',
                            labelText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            // Use TextFormField for obscureText and suffixIcon
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              controller.password = value;
                            },
                            controller: controller.passwordController,
                            obscureText: controller.obscureText,
                            decoration: InputDecoration(
                              border: AppTheme
                                  .darkTheme.inputDecorationTheme.border,
                              enabledBorder: AppTheme
                                  .darkTheme.inputDecorationTheme.enabledBorder,
                              focusedBorder: AppTheme
                                  .darkTheme.inputDecorationTheme.focusedBorder,
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  controller.obscureText =
                                      !controller.obscureText;
                                  controller.update();
                                },
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
                                onPressed: () async {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.isLoading = true;
                                    controller.update();
                                    try {
                                      UserCredential user =
                                          await controller.registerUser();
                                      Get.off(AppRouter.homeRoute);

                                      print(user.user!.uid);
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'weak-password') {
                                        buildShowSnackBar(context,
                                            'This password is too week.');
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        buildShowSnackBar(context,
                                            'This account already exists for that email.');
                                      }
                                    } catch (e) {
                                      log(e.toString());
                                    }
                                    controller.isLoading = false;
                                    controller.update();
                                  }
                                },
                                child: const Text(
                                  'SIGN UP',
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
                                'Already have an account?',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRouter.loginRoute);
                                },
                                child: const Text(
                                  'Login',
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
                                    onPressed: () async {
                                      controller.onLoadingChanged(true);
                                      try {
                                        await controller
                                            .signUpOrSignInWithFacebook(
                                                onLoadingChanged: (isLoading) {
                                          controller.isLoading =
                                              isLoading; // Update your loading state variable
                                        }).then((userCredential) {
                                          if (userCredential != null) {
                                            // credential of the user is the same as userCredential navigate to the next screen
                                            // Navigate to the next screen or update UI
                                            Navigator.pushNamed(
                                                context, AppRouter.homeRoute);
                                          } else {
                                            // Handle login/sign-up failure (e.g., show an error message)
                                            buildShowSnackBar(context,
                                                'Facebook sign-in failed or canceled.');
                                          }
                                          return null;
                                        });
                                      } catch (e) {
                                        log("Facebook Sign-In Error: $e");
                                        buildShowSnackBar(
                                            context, 'Facebook sign-in error.');
                                      } finally {
                                        controller..onLoadingChanged(false);
                                      }
                                    },
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
                                    onPressed: () async {
                                      controller.isLoading = true;

                                      try {
                                        UserCredential? userCredential =
                                            await controller.signInWithGoogle();
                                        if (userCredential != null) {
                                          log("Google sign-in successful!");
                                          Navigator.pushNamed(
                                              context, AppRouter.homeRoute);
                                        } else {
                                          buildShowSnackBar(context,
                                              'Google sign-in failed or canceled.'); // More descriptive message
                                        }
                                      } catch (e) {
                                        log("Google Sign-In Error: $e");

                                        buildShowSnackBar(context,
                                            'An error occurred during Google sign-in.');
                                      } finally {
                                        // Ensure loading indicator is stopped
                                        controller.isLoading = false;
                                      }
                                    },
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
                    )
            ],
          ),
        ),
      ),
    );
  }
}
