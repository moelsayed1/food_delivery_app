import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class autController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  late Function(bool) onLoadingChanged;
  bool isLoading = false;

  String name = '';
  String email = '';
  String password = '';



  Future<UserCredential?> signUpOrSignInWithFacebook({
    required Function(bool) onLoadingChanged, // For loading state
  }) async {
    try {

      onLoadingChanged(true); // Indicate loading start
      final LoginResult loginResult = await FacebookAuth.instance.login();
      onLoadingChanged(false); // Loading complete (regardless of success)

      if (loginResult.status == LoginStatus.success &&
          loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(
            loginResult.accessToken!.tokenString);

        try {
          final userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);
          // Success: userCredential now contains the User object
          return userCredential;
        } on FirebaseAuthException catch (e) {
          // Handle Firebase-specific errors during sign-in/sign-up
          log("Firebase error during Facebook auth: ${e.code} - ${e.message}");
          // Example: Show a specific error message based on e.code
          return null; // Or rethrow the error if you want
        }
      } else if (loginResult.status == LoginStatus.cancelled) {
        // Handle user cancellation
        log("Facebook login cancelled by the user.");
        return null;
      } else {
        // Handle other login failures
        log("Facebook login failed: ${loginResult.message}");
        return null;
      }
    } catch (e) {
      onLoadingChanged(false);
      log("Unexpected error during Facebook login: $e");
      return null;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Make it return nullable UserCredential
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null; // User canceled sign-in
      }
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  Future<UserCredential> registerUser() async {
    isLoading=true;
    update();
    UserCredential user =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    isLoading=false;
    update();
    return user;
  }
}
