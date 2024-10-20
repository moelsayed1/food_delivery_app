import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Text(
            'Home View Body',
          style: TextStyle(
            fontSize: 20,
          ),
          ),
        ],
      ),
    );
  }
}
