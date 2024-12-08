import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/Features/authentication/reset_password/manager/reset_password_cubit.dart';
import 'package:food_delivery_app/Features/authentication/reset_password/views/widgets/reset_password_text_fields.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/widgets/show_snack_bar.dart';
import 'reset_password_button.dart';
import 'reset_password_image.dart';
import 'reset_password_title.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, AppRouter.loginRoute,
                    (route) => false); // Navigate to login and clear the stack
            buildShowSnackBar(context, 'Password reset successful!');
          } else if (state is ResetPasswordFailure) {
            buildShowSnackBar(context, state.errMessage);
            log(state.errMessage);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: context
                    .read<ResetPasswordCubit>()
                    .formKey,
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AppBarIcons(),
                        SizedBox(height: 50.h),
                        const ResetPasswordImage(),
                        SizedBox(height: 30.h),
                        const ResetPasswordTitle(),
                        SizedBox(height: 20.h),
                        ResetPasswordTextFields(
                            newPasswordController: context.read<ResetPasswordCubit>().newPasswordController,
                            confirmPasswordController: context.read<ResetPasswordCubit>().confirmPasswordController,
                            obscureText: context.watch<ResetPasswordCubit>().obscureText,
                            toggleObscureText: context.read<ResetPasswordCubit>().toggleObscureText,
                        ),
                        SizedBox(height: 20.h),
                        if (state is ResetPasswordFailure) // Show error message only on failure
                          Text(
                            state.errMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        // Display the error message
                        SizedBox(height: 25.h),
                        if (state is ResetPasswordLoading)
                          const Center(child: CircularProgressIndicator())
                        else
                          ResetPasswordButton(
                            onPressed: () => context.read<ResetPasswordCubit>().resetPassword(),
                          ),
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
