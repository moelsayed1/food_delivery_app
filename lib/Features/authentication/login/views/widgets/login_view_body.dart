import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/Features/authentication/login/manager/login_cubit.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/themes/app_theme.dart';
import 'package:food_delivery_app/core/utils/widgets/show_snack_bar.dart';
import 'login_button.dart';
import 'login_social_media_buttons.dart';
import 'login_text_fields.dart';
import 'login_title.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamed(context, AppRouter.homeRoute);
          } else if (state is LoginFailure) {
            buildShowSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: context.read<LoginCubit>().formKey,
              child: SafeArea(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppBarIcons(),
                        SizedBox(height: 80.h),
                        const LoginTitle(),
                        SizedBox(height: 30.h),
                        LoginTextFields(
                          emailController: context.read<LoginCubit>().emailController,
                          passwordController: context.read<LoginCubit>().passwordController,
                          obscureText: context.watch<LoginCubit>().obscureText, // Access from Cubit
                          onObscureTextPressed: context.read<LoginCubit>().toggleObscureText,
                        ),
                        SizedBox(height: 25.h),
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
                        SizedBox(height: 20.h),
                        if (state is LoginLoading)
                          const Center(
                            child: CircularProgressIndicator(),
                          )
                        else LoginButton(
                        onPressed: () => context.read<LoginCubit>().loginUser(),
                        ),
                        SizedBox(height: 25.h),
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
                        SizedBox(height: 25.h),
                        Row(
                          children: [
                            Expanded(child: Divider(thickness: 1, color: Colors.white.withOpacity(0.5))),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text('Sign Up with', style: TextStyle(fontSize: 16.sp)),
                            ),
                            Expanded(child: Divider(thickness: 1, color: Colors.white.withOpacity(0.5))),
                          ],
                        ),
                        SizedBox(height: 35.h),
                        const LoginSocialMediaButtons(),
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


