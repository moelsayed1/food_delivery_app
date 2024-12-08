import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final formKey = GlobalKey<FormState>();

  final newPasswordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool obscureText = true;

  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      if (newPasswordController.text != confirmPasswordController.text) {
        emit(ResetPasswordFailure(errMessage: 'Passwords do not match'));
        return;
      } else if (newPasswordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        emit(ResetPasswordFailure(
            errMessage: 'Please fill in both password fields'));
        return;
      }
      emit(ResetPasswordLoading());
      try {
        await FirebaseAuth.instance.currentUser
            ?.updatePassword(newPasswordController.text);
        emit(ResetPasswordSuccess());
      } on FirebaseAuthException catch (e) {
        emit(ResetPasswordFailure(
            errMessage: 'Error resetting password. ${e.message}'));
      }
    }
  }

  void toggleObscureText() {
    obscureText = !obscureText;
    emit(ResetPasswordObscureTextToggle());
  }
}
