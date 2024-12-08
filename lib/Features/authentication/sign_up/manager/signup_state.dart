part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

final class SignupInitial extends SignupState {}
final class SignupLoading extends SignupState {}
final class SignupSuccess extends SignupState {

  final User user;

  SignupSuccess({required this.user});
}
final class SignupFailure extends SignupState {

  final String errMessage;

  SignupFailure({required this.errMessage});

}

class SignupObscureTextToggle extends SignupState {}
