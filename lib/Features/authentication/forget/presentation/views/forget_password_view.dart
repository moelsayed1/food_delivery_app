import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/forget/presentation/views/widgets/forget_view_body.dart';
import 'package:food_delivery_app/generated/assets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {

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
          child: SizedBox.expand( // Use SizedBox.expand to fill available space
            child: Column(
              children: [
                Expanded( // Push SignUpViewBody to the top
                  child: ForgetViewBody(
                    onLoadingChanged: (bool loading) {
                      setState(() {
                        isLoading = loading;
                      });
                    },
                  ),
                ),
                // Add some bottom spacing if needed
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
