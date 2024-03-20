part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}

final class SignInSuccess extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInFailure extends AuthState {
  final String errorMessage;

  SignInFailure({required this.errorMessage});
}

final class GetUserLoading extends AuthState {}

final class GetUserSuccess extends AuthState {
  final UserDataModel user;

  GetUserSuccess({required this.user});
}

final class GetUserFailure extends AuthState {
  final String errorMessage;

  GetUserFailure({required this.errorMessage});
}
