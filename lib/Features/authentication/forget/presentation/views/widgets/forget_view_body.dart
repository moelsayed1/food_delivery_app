import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/Features/authentication/forget/presentation/manager/forget_password_cubit.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/widgets/show_snack_bar.dart';
import 'forget_password_button.dart';
import 'forget_password_image.dart';
import 'forget_password_text_field.dart';
import 'forget_password_title.dart';

class ForgetViewBody extends StatefulWidget {
  const ForgetViewBody({super.key, required this.onLoadingChanged});

  final Function(bool) onLoadingChanged;

  @override
  State<ForgetViewBody> createState() => _ForgetViewBodyState();
}

class _ForgetViewBodyState extends State<ForgetViewBody> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            Navigator.pushNamed(context, AppRouter.resetRoute);
          } else if (state is ForgetPasswordFailure) {
            buildShowSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: (context).read<ForgetPasswordCubit>().formKey,
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AppBarIcons(),
                        const SizedBox(
                          height: 120,
                        ),
                        const ForgetPasswordImage(),
                        const SizedBox(
                          height: 20,
                        ),
                        const ForgetPasswordTitle(),
                        const SizedBox(
                          height: 20,
                        ),
                        ForgetPasswordTextField(
                            emailController: context
                                .read<ForgetPasswordCubit>()
                                .emailController),
                        const SizedBox(
                          height: 40,
                        ),
                        (state is ForgetPasswordLoading)
                            ? const CircularProgressIndicator()
                            : ForgetPasswordButton(
                          onPressed: context.read<ForgetPasswordCubit>().sendPasswordResetEmail,
                                formKey:
                                    context.read<ForgetPasswordCubit>().formKey,
                                widget: widget,
                                emailController: context
                                    .read<ForgetPasswordCubit>()
                                    .emailController,
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
