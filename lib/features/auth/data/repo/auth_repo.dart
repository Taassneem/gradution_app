import 'package:dartz/dartz.dart';
import 'package:gradution_app/core/errors/server_failure.dart';
import 'package:gradution_app/features/auth/data/models/forget_password_model.dart';
import 'package:gradution_app/features/auth/data/models/reset_password_model/reset_password_model.dart';
import 'package:gradution_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:gradution_app/features/auth/data/models/sign_up_model/sign_up_model.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, SignInModel>> signIn({
    required String signInEmail,
    required String signInPassword,
  });
  Future<Either<ServerFailure, SignUpModel>> signUp({
    required String signUpName,
    required String signUpEmail,
    required String signUpPassword,
    required String confirmPassword,
  });
  Future<Either<ServerFailure, ForgetPasswordModel>> forgetPassword({
    required String email,
  });
  Future<Either<ServerFailure, ResetPasswordModel>> resetPassword({
    required String forgetCode,
    required String newPassword,
    required String confirmPassword,
  });
}
