import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/features/auth/data/models/forget_password_model.dart';
import 'package:gradution_app/features/auth/data/models/reset_password_model/reset_password_model.dart';
import 'package:gradution_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:gradution_app/features/auth/data/models/sign_up_model/sign_up_model.dart';
import 'package:gradution_app/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.getAuthRepo) : super(AuthInitial());
  final AuthRepo getAuthRepo;
  GlobalKey<FormState> signInKey = GlobalKey();
  GlobalKey<FormState> signUnKey = GlobalKey();
  GlobalKey<FormState> forgetKey = GlobalKey();
  GlobalKey<FormState> newPassKey = GlobalKey();

  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  TextEditingController forgetEmail = TextEditingController();
  TextEditingController resetEmail = TextEditingController();
  TextEditingController forgetCode = TextEditingController();
  TextEditingController resetNewPassword = TextEditingController();
  TextEditingController resetConfirmPassword = TextEditingController();

  SignUpModel? register;
  SignInModel? user;

  signUp() async {
    emit(SignUpLoading());
    var result = await getAuthRepo.signUp(
        signUpName: signUpName.text,
        signUpEmail: signUpEmail.text,
        signUpPassword: signUpPassword.text,
        confirmPassword: confirmPassword.text);
    result.fold(
        (failure) =>
            emit(SignUpFailure(errorMessage: failure.failure.errorMessage)),
        (signUpRespone) => emit(SignUpSuccess(signUpModel: signUpRespone)));
  }

  signIn() async {
    emit(SignInLoading());
    var result = await getAuthRepo.signIn(
        signInEmail: signInEmail.text, signInPassword: signInPassword.text);
    result.fold(
        (failure) =>
            emit(SignInFailure(errorMessage: failure.failure.errorMessage)),
        (signInResponse) => emit(SignInSuccess(signInModel: signInResponse)));
  }

  forgetPassword() async {
    emit(ForgetPasswordLoading());
    var result = await getAuthRepo.forgetPassword(email: forgetEmail.text);
    result.fold(
        (failure) => emit(
            ForgetPasswordFailure(errorMessage: failure.failure.errorMessage)),
        (forgetPassword) =>
            emit(ForgetPasswordSuccess(forgetModel: forgetPassword)));
  }

  resetPassword() async {
    emit(ResetPasswordLoading());
    var result = await getAuthRepo.resetPassword(
        forgetCode: forgetCode.text,
        newPassword: resetNewPassword.text,
        confirmPassword: resetConfirmPassword.text);
    result.fold(
        (failure) => emit(
            ResetPasswordFailure(errorMessage: failure.failure.errorMessage)),
        (resetPasswordResopnse) =>
            emit(ResetPasswordSuccess(resetModel: resetPasswordResopnse)));
  }
}
