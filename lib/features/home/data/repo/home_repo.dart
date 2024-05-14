import 'package:dartz/dartz.dart';
import 'package:gradution_app/core/errors/server_failure.dart';
import 'package:gradution_app/features/home/data/models/change_password_model.dart';
import 'package:gradution_app/features/home/data/models/delete_user_model.dart';
import 'package:gradution_app/features/home/data/models/edit_profile_model/edit_profile_model.dart';
import 'package:gradution_app/features/home/data/models/edit_profile_pic_model/edit_profile_pic_model.dart';
import 'package:gradution_app/features/home/data/models/log_out_model.dart';
import 'package:gradution_app/features/home/data/models/uplaod_profile_pic_model/uplaod_profile_pic_model.dart';
import 'package:gradution_app/features/home/data/models/user_data_model/user_data_model.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, ChangePasswordModel>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<Either<ServerFailure, LogOutModel>> logOut({required String userId});
  Future<Either<ServerFailure, EditProfileModel>> editProfile({
    required String userName,
    required String email,
  });
  Future<Either<ServerFailure, EditProfilePicModel>> editProfilePic(
      {required String image});
  Future<Either<ServerFailure, UplaodProfilePicModel>> uplaodProfilePic(
      {required String image});
  Future<Either<ServerFailure, DeleteUserModel>> deleteUser();
  Future<Either<ServerFailure, UserDataModel>> getUserData();
}
