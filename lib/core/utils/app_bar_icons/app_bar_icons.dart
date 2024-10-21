import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    super.key, this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Material(
          color: Colors.transparent,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}