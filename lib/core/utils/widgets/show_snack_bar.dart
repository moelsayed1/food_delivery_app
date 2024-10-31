import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildShowSnackBar(
    BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 5,
      backgroundColor: Colors.grey[850],
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 27.w,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
      content: SizedBox(
        height: 20.h,
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}