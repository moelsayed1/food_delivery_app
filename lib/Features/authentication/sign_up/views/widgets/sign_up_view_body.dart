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

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key, required this.onLoadingChanged});

  final Function(bool) onLoadingChanged;

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  bool obscureText = true;

  bool isLoading = false;

  String name = '';
  String email = '';
  String password = '';

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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter this field';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        name = value;
                        log(name);
                      });
                    },
                    hintText: 'Enter Your Full Name',
                    labelText: 'Full Name',
                    keyboardType: TextInputType.name,
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter this field';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        email = value;
                        log(email);
                      });
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                        log(password);
                      });
                    },
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
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: SizedBox(
                      height: 55,
                      width: 200,
                      child: CustomElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            try {
                              UserCredential user = await registerUser();
                              Navigator.pushNamed(context, AppRouter.homeRoute);
                              print(user.user!.uid);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                buildShowSnackBar(
                                    context, 'This password is too week.');
                              } else if (e.code == 'email-already-in-use') {
                                buildShowSnackBar(context,
                                    'This account already exists for that email.');
                              }
                            } catch (e) {
                              log(e.toString());
                            }
                            isLoading = false;
                            setState(() {});
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
                          Navigator.pushNamed(context, AppRouter.loginRoute);
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
                            onPressed: ()  async {
                              widget.onLoadingChanged(true);
                              try {
                                await signUpOrSignInWithFacebook(onLoadingChanged: (isLoading) {
                                  setState(() {
                                    this.isLoading = isLoading; // Update your loading state variable
                                  });
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
                                widget.onLoadingChanged(false);
                              }},
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
                              setState(() {  // Start loading indicator
                                isLoading = true;
                              });
                              try {
                                UserCredential? userCredential = await signInWithGoogle();
                                if (userCredential != null) {
                                  log("Google sign-in successful!");
                                  Navigator.pushNamed(context, AppRouter.homeRoute);
                                } else {
                                  buildShowSnackBar(context, 'Google sign-in failed or canceled.'); // More descriptive message
                                }
                              } catch (e) {
                                log("Google Sign-In Error: $e");
                                buildShowSnackBar(context, 'An error occurred during Google sign-in.');
                              } finally {  // Ensure loading indicator is stopped
                                setState(() {
                                  isLoading = false;
                                });
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
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential?> signUpOrSignInWithFacebook({
    required Function(bool) onLoadingChanged, // For loading state
  }) async {
    try {
      onLoadingChanged(true); // Indicate loading start
      final LoginResult loginResult = await FacebookAuth.instance.login();
      onLoadingChanged(false); // Loading complete (regardless of success)

      if (loginResult.status == LoginStatus.success &&
          loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

        try {
          final userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);
          // Success: userCredential now contains the User object
          return userCredential;
        } on FirebaseAuthException catch (e) {
          // Handle Firebase-specific errors during sign-in/sign-up
          log("Firebase error during Facebook auth: ${e.code} - ${e.message}");
          // Example: Show a specific error message based on e.code
          return null; // Or rethrow the error if you want
        }
      } else if (loginResult.status == LoginStatus.cancelled) {
        // Handle user cancellation
        log("Facebook login cancelled by the user.");
        return null;
      } else {
        // Handle other login failures
        log("Facebook login failed: ${loginResult.message}");
        return null;
      }
    } catch (e) {
      onLoadingChanged(false);
      log("Unexpected error during Facebook login: $e");
      return null;
    }
  }

  Future<UserCredential?> signInWithGoogle() async { // Make it return nullable UserCredential
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null; // User canceled sign-in
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  Future<UserCredential> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    return user;
  }
}
