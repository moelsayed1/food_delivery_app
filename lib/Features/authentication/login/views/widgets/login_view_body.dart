import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';
import 'package:food_delivery_app/core/utils/custom_text_field/custom_text_field.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/themes/app_theme.dart';
import 'package:food_delivery_app/core/utils/widgets/show_snack_bar.dart';
import 'package:food_delivery_app/generated/assets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewBody extends StatefulWidget {
   const LoginViewBody({super.key, required this.onLoadingChanged});

  final Function(bool) onLoadingChanged;

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  bool isLoading = false;

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarIcons(),
                  const SizedBox(height: 100),
                  const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 30),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter this field';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      email = value;
                      log('$email');
                    },
                    hintText: 'Enter Your Email',
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      password = value;
                      log('$password');
                    },
                    controller: passwordController,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      border: AppTheme.darkTheme.inputDecorationTheme.border,
                      enabledBorder: AppTheme.darkTheme.inputDecorationTheme.enabledBorder,
                      focusedBorder: AppTheme.darkTheme.inputDecorationTheme.focusedBorder,
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.forgetRoute);
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 16, color: AppTheme.darkTheme.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Center(
                    child: SizedBox(
                      height: 55,
                      width: 200,
                      child: CustomElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            widget.onLoadingChanged(true);
                            try {
                              UserCredential user = await signInUser();
                              Navigator.pushNamed(context, AppRouter.homeRoute);
                              log(user.user!.uid);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'wrong-password') {
                                buildShowSnackBar(context, 'Wrong password provided for that user.');
                              } else if (e.code == 'user-not-found') {
                                buildShowSnackBar(context, 'No user found for that email.');
                              }
                            } catch (e) {
                              log(e.toString());
                            } finally {
                              widget.onLoadingChanged(false);
                            }
                          }
                        },

                        child: const Text('Login', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?', style: TextStyle(fontSize: 16)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouter.signupRoute);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 16, color: Color(0xffFF5722)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Row(
                    children: [
                      Expanded(child: Divider(thickness: 1, color: Colors.white.withOpacity(0.5))),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Sign Up with', style: TextStyle(fontSize: 16)),
                      ),
                      Expanded(child: Divider(thickness: 1, color: Colors.white.withOpacity(0.5))),
                    ],
                  ),

                  const SizedBox(height: 30),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 160,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              widget.onLoadingChanged(true);
                              try {
                                UserCredential? userCredential =
                                await signInWithFacebook();

                                if (userCredential != null) {
                                  // Navigate to the next screen
                                  Navigator.pushNamed(
                                      context, AppRouter.homeRoute);
                                } else {
                                  buildShowSnackBar(context,
                                      'Facebook sign-in failed or canceled.');
                                }
                              } catch (e) {
                                log("Facebook Sign-In Error: $e");
                                buildShowSnackBar(
                                    context, 'Facebook sign-in error.');
                              } finally {
                                widget.onLoadingChanged(false);
                              }
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff1877F2)),
                            label: const Text('Facebook', style: TextStyle(fontSize: 16)),
                            icon: Image.asset(Assets.imagesLogoFacebook, height: 30),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 160,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              widget.onLoadingChanged(true);
                              try {
                                UserCredential? userCredential = await signInWithGoogle();
                                if (userCredential != null) {
                                  log("Google sign-in successful!");
                                  Navigator.pushNamed(context, AppRouter.homeRoute);
                                } else {
                                  buildShowSnackBar(context, 'Google sign-in failed or canceled.');
                                }
                              } catch (e) {
                                log("Google Sign-In Error: $e");
                                buildShowSnackBar(context, 'An error occurred during Google sign-in.');
                              } finally {
                                widget.onLoadingChanged(false);
                              }
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                            label: Text('Google', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5))),
                            icon: Image.asset(Assets.imagesLogoGoogle, height: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success &&
          loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(
          loginResult.accessToken!.tokenString,
        );
        return await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      } else {
        // Handle login failure
        log("Facebook Login failed: ${loginResult.message}");
        return null;
      }
    } catch (e) {
      log("Error during Facebook login: $e");
      return null;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log("Google Sign-In Error: $e");
      return null;
    }
  }

  Future<UserCredential> signInUser() async {
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    return user;
  }
}
