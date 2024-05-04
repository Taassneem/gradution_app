import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:gradution_app/features/auth/data/models/sign_up_model/sign_up_model.dart';
import 'package:gradution_app/features/auth/data/models/user_data_model/user_data_model.dart';
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
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  SignUpModel? register;
  SignInModel? user;
  UserDataModel? data;
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
        (signUpRespone) => emit(SignUpSuccess()));
  }

  signIn() async {
    emit(SignInLoading());
    var result = await getAuthRepo.signIn(
        signInEmail: signInEmail.text, signInPassword: signInPassword.text);
    result.fold(
        (failure) =>
            emit(SignInFailure(errorMessage: failure.failure.errorMessage)),
        (signInResponse) => emit(SignInSuccess()));
  }

  // getUserData() async {
  //   try {
  //     emit(GetUserLoading());
  //     final response = await api.get(
  //         EndPoint.confirm(
  //             getIt.get<CacheHelper>().getData(key: ApiKey.loginToken)),
  //         data: {
  //           ApiKey.email: signInEmail.text,
  //           ApiKey.password: signInPassword.text
  //         });
  //     data = UserDataModel.fromJson(response);
  //     emit(GetUserSuccess(user: data!));
  //   } on ServerFailure catch (e) {
  //     emit(GetUserFailure(errorMessage: e.failure.errorMessage));
  //   }
  // }
}
