part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final SignUpModel signUpModel;

  SignUpSuccess({required this.signUpModel});
}

final class SignUpFailure extends AuthState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}

final class SignInSuccess extends AuthState {
  final SignInModel signInModel;

  SignInSuccess({required this.signInModel});
}

final class SignInLoading extends AuthState {}

final class SignInFailure extends AuthState {
  final String errorMessage;

  SignInFailure({required this.errorMessage});
}

final class ForgetPasswordSuccess extends AuthState {
  final ForgetPasswordModel forgetModel;

  ForgetPasswordSuccess({required this.forgetModel});
}

final class ForgetPasswordLoading extends AuthState {}

final class ForgetPasswordFailure extends AuthState {
  final String errorMessage;

  ForgetPasswordFailure({required this.errorMessage});
}

final class ResetPasswordSuccess extends AuthState {
  final ResetPasswordModel resetModel;

  ResetPasswordSuccess({required this.resetModel});
}

final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordFailure extends AuthState {
  final String errorMessage;

  ResetPasswordFailure({required this.errorMessage});
}
