import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;

  Future<void> loginUser() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      try {
        await signInUser();
        emit(LoginSuccess(FirebaseAuth.instance.currentUser!));
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for that user.';
        } else {
          errorMessage =
              'Error: ${e.message}'; // Generic error message with details
        }
        emit(LoginFailure(errMessage: errorMessage)); // Emit failure state
      }
    }
  }

  Future<UserCredential> signInUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    return user;
  }

  Future<void> signInWithFacebook() async {
    emit(LoginLoading());
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success &&
          loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
        final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

        if (userCredential.user != null) {
          emit(LoginSuccess(userCredential.user!));
        } else {
          emit(LoginFailure(errMessage: "User object is null after Facebook login."));
        }
      } else {
        emit(LoginFailure(errMessage: loginResult.message ?? "Facebook login failed"));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: "Error during Facebook login: ${e.toString()}"));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(LoginFailure(errMessage: "Google sign-in cancelled")); // Emit a specific error for cancellation
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        emit(LoginSuccess(userCredential.user!));
      } else {
        emit(LoginFailure(errMessage: "User object is null after Google sign-in."));
      }

    } catch (e) {
      emit(LoginFailure(errMessage: "Error during Google sign-in: ${e.toString()}"));
    }
  }

  void toggleObscureText() {
    obscureText = !obscureText;
    emit(LoginObscureTextToggle()); //emit a state when obscure text toggles
  }
}
