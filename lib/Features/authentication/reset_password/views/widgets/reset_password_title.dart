import 'package:flutter/material.dart';

class ResetPasswordTitle extends StatelessWidget {
  const ResetPasswordTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Text(
          'Reset your password',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Text(
        'Here\'s a tip: Use a combination of\nNumbers, Uppercase, lowercase and\nSpecial characters',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}