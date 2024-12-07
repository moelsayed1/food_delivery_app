import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future<void> sendPasswordResetEmail () async {

    if(formKey.currentState!.validate()) {
      emit(ForgetPasswordLoading());

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
        emit(ForgetPasswordSuccess());
      } on FirebaseAuthException catch (e) {
        emit(ForgetPasswordFailure(errMessage: e.message!));
      }
    }
  }
}
