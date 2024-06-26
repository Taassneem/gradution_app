import 'package:dartz/dartz.dart';
import 'package:gradution_app/core/api/api_consumer.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';

import 'package:gradution_app/core/errors/server_failure.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/features/home/data/models/change_password_model.dart';
import 'package:gradution_app/features/home/data/models/delete_user_model.dart';
import 'package:gradution_app/features/home/data/models/edit_profile_model/edit_profile_model.dart';
import 'package:gradution_app/features/home/data/models/edit_profile_pic_model/edit_profile_pic_model.dart';
import 'package:gradution_app/features/home/data/models/log_out_model.dart';
import 'package:gradution_app/features/home/data/models/upload_profile_pic_model/upload_profile_pic_model.dart';
import 'package:gradution_app/features/home/data/models/user_data_model/user_data_model.dart';

import 'profile_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, ChangePasswordModel>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final response = await api.post(
          EndPoint.changePassword(
              getIt.get<CacheHelper>().getData(key: ApiKey.loginId)),
          data: {
            ApiKey.oldPassword: oldPassword,
            ApiKey.newPassword: newPassword
          });
      final changePass = ChangePasswordModel.fromJson(response);
      return right(changePass);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, DeleteUserModel>> deleteUser() async {
    try {
      final response = await api.delete(EndPoint.deleteUser(
          getIt.get<CacheHelper>().getData(key: ApiKey.loginId)));
      final deleteUser = DeleteUserModel.fromJson(response);
      return right(deleteUser);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, EditProfileModel>> editProfile({
    required String userName,
    required String email,
  }) async {
    try {
      final response = await api.patch(
          EndPoint.editProfile(
              getIt.get<CacheHelper>().getData(key: ApiKey.loginId)),
          data: {
            ApiKey.userName: userName,
            ApiKey.email: email,
          });
      final editProfile = EditProfileModel.fromJson(response);
      return right(editProfile);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, UserDataModel>> getUserData() async {
    try {
      final response = await api.get(EndPoint.getuserById(
          getIt.get<CacheHelper>().getData(key: ApiKey.loginId)));
      final getUserData = UserDataModel.fromJson(response);
      return right(getUserData);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, LogOutModel>> logOut(
      {required String userId}) async {
    try {
      final response =
          await api.post(EndPoint.logOut, data: {ApiKey.userId: userId});
      final logOut = LogOutModel.fromJson(response);
      return right(logOut);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, EditProfilePicModel>> editProfilePic(
      {required dynamic image}) async {
    try {
      final response = await api.post(
        EndPoint.editProfilePic(
            getIt.get<CacheHelper>().getData(key: ApiKey.loginId)),
        data: {ApiKey.image: image},
        isFormData: true,
      );
      final editProfilePic = EditProfilePicModel.fromJson(response);
      return right(editProfilePic);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, UploadProfilePicModel>> uplaodProfilePic(
      {required dynamic image}) async {
    try {
      final response = await api.post(
        EndPoint.uploadProfilepic(
            getIt.get<CacheHelper>().getData(key: ApiKey.loginId)),
        data: {ApiKey.image: image},
        isFormData: true,
      );
      final uploadProfilePic = UploadProfilePicModel.fromJson(response);
      return right(uploadProfilePic);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }
}
