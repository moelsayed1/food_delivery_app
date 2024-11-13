import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/sign_up/views/widgets/sign_up_view_body.dart';
import 'package:food_delivery_app/core/utils/background_scaffold_view_ui/background_scaffold_view_ui.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundScaffoldViewUi(
      child: SignUpViewBody(),
    );
  }
}


