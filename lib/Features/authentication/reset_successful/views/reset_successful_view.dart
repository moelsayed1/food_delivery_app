import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/authentication/reset_successful/views/widgets/reset_successful_view_body.dart';
import 'package:food_delivery_app/core/utils/background_scaffold_view_ui/background_scaffold_view_ui.dart';

class ResetSuccessfulView extends StatelessWidget {
  const ResetSuccessfulView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundScaffoldViewUi(
      child: ResetSuccessfulViewBody(),
    );
  }
}
