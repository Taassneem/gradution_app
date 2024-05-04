import 'package:dartz/dartz.dart';
import 'package:gradution_app/core/api/api_consumer.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/errors/server_failure.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:gradution_app/features/auth/data/models/sign_up_model/sign_up_model.dart';

import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiConsumer api;

  AuthRepoImpl({required this.api});

  @override
  Future<Either<ServerFailure, SignInModel>> signIn({
    required String signInEmail,
    required String signInPassword,
  }) async {
    try {
      final response = await api.post(EndPoint.login,
          data: {ApiKey.email: signInEmail, ApiKey.password: signInPassword});
      final user = SignInModel.fromJson(response);
      getIt
          .get<CacheHelper>()
          .saveData(key: ApiKey.loginToken, value: user.userUpdated!.token);
      return right(user);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, SignUpModel>> signUp({
    required String signUpName,
    required String signUpEmail,
    required String signUpPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await api.post(EndPoint.signUp, data: {
        ApiKey.userName: signUpName,
        ApiKey.email: signUpEmail,
        ApiKey.password: signUpPassword,
        ApiKey.confirmPassword: confirmPassword
      });
      final register = SignUpModel.fromJson(response);
      return right(register);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }
}
