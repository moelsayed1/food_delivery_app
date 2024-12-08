import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  bool obscureText = true;


  Future<void> signUpOrSignInWithFacebook() async { // Changed to return void, emits states
    emit(SignupLoading());
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();


      if (loginResult.status == LoginStatus.success &&
          loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

        try {
          final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
          if (userCredential.user != null) {
            emit(SignupSuccess(user: userCredential.user!));
          } else {
            emit(SignupFailure(errMessage: "User object is null after Facebook login."));
          }
        } on FirebaseAuthException catch (e) {
          log("Firebase error during Facebook auth: ${e.code} - ${e.message}");
          emit(SignupFailure(errMessage: e.message ?? 'Facebook Sign-up failed'));

        }
      } else if (loginResult.status == LoginStatus.cancelled) {
        emit(SignupFailure(errMessage: "Facebook login cancelled by the user."));

      } else {
        emit(SignupFailure(errMessage: loginResult.message ?? "Facebook login failed"));


      }
    } catch (e) {

      log("Unexpected error during Facebook login: $e");

      emit(SignupFailure(errMessage: "An unexpected error occurred: ${e.toString()}"));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(SignupLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(SignupFailure(errMessage: "Google sign-in cancelled"));
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        emit(SignupSuccess(user: userCredential.user!));
      } else {
        emit(SignupFailure(errMessage: "User object is null after Google sign-in."));
      }

    } catch (e) {
      emit(SignupFailure(errMessage: "Error during Google sign-in: ${e.toString()}"));
    }
  }

  Future<void> registerUser() async {
    if (formKey.currentState!.validate()) {
      emit(SignupLoading());
      try {
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        if (userCredential.user != null) {
          await userCredential.user!.updateDisplayName(nameController.text.trim());
          final updatedUser = FirebaseAuth.instance.currentUser;
          if (updatedUser != null) {
            emit(SignupSuccess(user: updatedUser));
          } else {
            emit(SignupFailure(errMessage: 'Failed to update user name'));
          }
        } else {
          emit(SignupFailure(errMessage: "User object is null after sign-up."));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(SignupFailure(errMessage: 'The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          emit(SignupFailure(errMessage: 'The account already exists for that email.'));
        } else {
          emit(SignupFailure(errMessage: e.message ?? 'Sign up failed'));
        }
      } catch (e) {
        log(e.toString());
        emit(SignupFailure(errMessage: "An unexpected error occurred: ${e.toString()}"));
      }
    }
  }

  void toggleObscureText() {
    obscureText = !obscureText;
    emit(SignupObscureTextToggle()); //emit a state when obscure text toggles
  }
}

