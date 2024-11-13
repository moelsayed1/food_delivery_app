import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/sign_up/views/widgets/sign_up_view_body.dart';
import 'package:food_delivery_app/core/utils/background_scaffold_view_ui/background_scaffold_view_ui.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatefulWidget {

  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: BackgroundScaffoldViewUi(
        child: SignUpViewBody(
          onLoadingChanged: (bool loading) {
            setState(() {
              isLoading = loading;
            });
          },
        ),
      ),
    );
  }
}


