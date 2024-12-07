import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/sign_up/views/widgets/sign_up_view_body.dart';
import 'package:food_delivery_app/generated/assets.dart';
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
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(Assets.imagesBackground),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: SignUpViewBody(
            onLoadingChanged: (bool loading) {
              setState(() {
                isLoading = loading;
              });
            },
          ),
        ),
      ),
    );
  }
}
