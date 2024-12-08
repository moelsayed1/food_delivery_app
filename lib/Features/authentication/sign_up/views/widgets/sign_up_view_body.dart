import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/Features/authentication/sign_up/manager/signup_cubit.dart';
import 'package:food_delivery_app/Features/authentication/sign_up/views/widgets/signup_social_media_buttons.dart';
import 'package:food_delivery_app/Features/authentication/sign_up/views/widgets/signup_text_fields.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/widgets/show_snack_bar.dart';
import 'sign_up_title.dart';
import 'signup_button.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.pushNamed(context, AppRouter.homeRoute);
          } else if (state is SignupFailure) {
            buildShowSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: context.read<SignupCubit>().formKey,
              child: SafeArea(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppBarIcons(),
                        SizedBox(
                          height: 100.h,
                        ),
                        const SignUpTitle(),
                        SizedBox(
                          height: 30.h,
                        ),
                        SignupTextFields(
                          nameController: context.read<SignupCubit>().nameController,
                          emailController: context.read<SignupCubit>().emailController,
                          passwordController: context.read<SignupCubit>().passwordController,
                          obscureText: context.watch<SignupCubit>().obscureText,
                          onObscureTextPressed: context.read<SignupCubit>().toggleObscureText,
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        if (state is SignupLoading)  // Show loading indicator while signing up
                          const Center(child: CircularProgressIndicator())
                        else
                          SignupButton( // Use SignupButton widget
                            onPressed: () => context.read<SignupCubit>().registerUser(),
                          ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRouter.loginRoute);
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xffFF5722),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                'Sign Up with',
                                style: TextStyle(
                                  fontSize: 16.sp,
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
                        SizedBox(
                          height: 30.h,
                        ),
                        const SignupSocialMediaButtons(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
