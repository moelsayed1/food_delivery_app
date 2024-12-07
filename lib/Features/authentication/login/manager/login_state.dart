part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
  LoginSuccess(User user);
}
final class LoginFailure extends LoginState {

  final String errMessage;
  LoginFailure({required this.errMessage});
}
class LoginObscureTextToggle extends LoginState {}
