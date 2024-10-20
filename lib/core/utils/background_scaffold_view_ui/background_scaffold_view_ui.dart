import 'package:flutter/material.dart';
import 'package:food_delivery_app/generated/assets.dart';

class BackgroundScaffoldViewUi extends StatelessWidget {
  const BackgroundScaffoldViewUi({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: child,
              ),
              // Add some bottom spacing if needed
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}