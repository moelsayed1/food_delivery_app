part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordLoading extends ForgetPasswordState {}
final class ForgetPasswordSuccess extends ForgetPasswordState {}
final class ForgetPasswordFailure extends ForgetPasswordState {

  final String errMessage;
  ForgetPasswordFailure({required this.errMessage});
}
