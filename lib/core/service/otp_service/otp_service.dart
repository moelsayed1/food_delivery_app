import 'package:cloud_functions/cloud_functions.dart';

class OtpService {
  Future<void> requestOtp(String email) async {
    try {
      final response = await FirebaseFunctions.instance
          .httpsCallable('generateAndEmailOTP')
          .call({'email': email});

      print(response.data['message']);
    } catch (error) {
      print('Error requesting OTP: $error');
    }
  }

  Future<void> resendOtp(String email) async {
    await requestOtp(email); // Reuse existing OTP request method
  }
}
