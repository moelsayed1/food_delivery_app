import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/reset_password/views/widgets/reset_password_view_body.dart';
import 'package:food_delivery_app/core/utils/background_scaffold_view_ui/background_scaffold_view_ui.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundScaffoldViewUi(
      child: ResetPasswordViewBody(),
    );
  }
}
