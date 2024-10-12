import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<Offset> logoAnimation;


  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    logoAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 10), () {
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
            animation: logoAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: logoAnimation.value,
                child: const Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/food logo.png'),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
