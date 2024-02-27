import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/errors/auth_failure.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/features/auth/data/repo/api_consumer.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.api) : super(AuthInitial());
  final ApiConsumer api;
  GlobalKey<FormState> signInKey = GlobalKey();
  GlobalKey<FormState> signUnKey = GlobalKey();
  GlobalKey<FormState> forgetKey = GlobalKey();
  GlobalKey<FormState> newPassKey = GlobalKey();

  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(EndPoint.signUp, data: {
        ApiKey.userName: signUpName.text,
        ApiKey.email: signUpEmail.text,
        ApiKey.password: signUpPassword.text,
        ApiKey.confirmpassword: confirmPassword.text
      });
      emit(SignUpSuccess());
    } on ServerFailure catch (e) {
      emit(SignUpFailure(errorMessage: e.failure.errorMessage));
    }
  }

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(EndPoint.login, data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text
      });
      emit(SignInSuccess());
    } on ServerFailure catch (e) {
      emit(SignInFailure(errorMessage: e.failure.errorMessage));
    }
  }
}
