import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/features/home/data/models/change_password_model.dart';
import 'package:gradution_app/features/home/data/models/delete_user_model.dart';
import 'package:gradution_app/features/home/data/models/edit_profile_model/edit_profile_model.dart';
import 'package:gradution_app/features/home/data/models/edit_profile_pic_model/edit_profile_pic_model.dart';
import 'package:gradution_app/features/home/data/models/log_out_model.dart';
import 'package:gradution_app/features/home/data/models/uplaod_profile_pic_model/uplaod_profile_pic_model.dart';
import 'package:gradution_app/features/home/data/models/user_data_model/user_data_model.dart';
import 'package:gradution_app/features/home/data/repo/home_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.homeRepo) : super(ProfileInitial());
  final HomeRepo homeRepo;
  GlobalKey editProfileKey = GlobalKey();
  GlobalKey changePassKey = GlobalKey();
  TextEditingController editUserName = TextEditingController();
  TextEditingController editEmail = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  String? uploadImage;
  String? editImage;

  Future<void> changePassword() async {
    emit(ChangePasswordLoading());
    final result = await homeRepo.changePassword(
        oldPassword: oldPassword.text, newPassword: newPassword.text);
    result.fold(
        (failure) => emit(
            ChangePasswordFailure(errorMessage: failure.failure.errorMessage)),
        (changePass) =>
            emit(ChangePasswordSuccess(changePasswordModel: changePass)));
  }

  Future<void> logOut() async {
    emit(LogOutLoading());
    final result = await homeRepo.logOut(
        userId: getIt.get<CacheHelper>().getData(key: ApiKey.loginId));
    result.fold(
        (failure) =>
            emit(LogOutFailure(errorMessage: failure.failure.errorMessage)),
        (logOut) => emit(LogOutSuccess(logOutModel: logOut)));
  }

  Future<void> editProfile() async {
    emit(EditProfileLoading());
    final result = await homeRepo.editProfile(
        userName: editUserName.text, email: editEmail.text);
    result.fold(
        (failure) => emit(
            EditProfileFailure(errorMessage: failure.failure.errorMessage)),
        (editProfile) =>
            emit(EditProfileSuccess(editProfileModel: editProfile)));
  }

  Future<void> deleteProfile() async {
    emit(DeleteUserLoading());
    final result = await homeRepo.deleteUser();
    result.fold(
        (failure) =>
            emit(DeleteUserFailure(errorMessage: failure.failure.errorMessage)),
        (deleteUser) => emit(DeleteUserSuccess(deleteUserModel: deleteUser)));
  }

  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    final result = await homeRepo.getUserData();
    result.fold(
        (failure) => emit(
            GetUserDataFailure(errorMessage: failure.failure.errorMessage)),
        (userData) => emit(GetUserDataSuccess(userDataModel: userData)));
  }

  Future<void> uploadProfilepic() async {
    emit(UploadProfilePicLoading());
    final result = await homeRepo.uplaodProfilePic(image: uploadImage!);
    result.fold(
        (failure) => emit(UploadProfilePicFailure(
            errorMessage: failure.failure.errorMessage)),
        (userPic) =>
            emit(UploadProfilePicSuccess(uplaodProfilePicModel: userPic)));
  }

  Future<void> editProfilePic() async {
    emit(EditProfilePicLoading());
    final result = await homeRepo.editProfilePic(image: editImage!);
    result.fold(
        (failure) => emit(
            EditProfilePicFailure(errorMessage: failure.failure.errorMessage)),
        (editProfilePic) =>
            emit(EditProfilePicSuccess(editProfilePicModel: editProfilePic)));
  }
}
