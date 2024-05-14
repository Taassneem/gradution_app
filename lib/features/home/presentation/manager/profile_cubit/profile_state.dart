part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ChangePasswordLoading extends ProfileState {}

final class ChangePasswordSuccess extends ProfileState {
  final ChangePasswordModel changePasswordModel;

  const ChangePasswordSuccess({required this.changePasswordModel});
}

final class ChangePasswordFailure extends ProfileState {
  final String errorMessage;

  const ChangePasswordFailure({required this.errorMessage});
}

final class LogOutLoading extends ProfileState {}

final class LogOutSuccess extends ProfileState {
  final LogOutModel logOutModel;

  const LogOutSuccess({required this.logOutModel});
}

final class LogOutFailure extends ProfileState {
  final String errorMessage;

  const LogOutFailure({required this.errorMessage});
}

final class EditProfileLoading extends ProfileState {}

final class EditProfileSuccess extends ProfileState {
  final EditProfileModel editProfileModel;

  const EditProfileSuccess({required this.editProfileModel});
}

final class EditProfileFailure extends ProfileState {
  final String errorMessage;

  const EditProfileFailure({required this.errorMessage});
}

final class EditProfilePicLoading extends ProfileState {}

final class EditProfilePicSuccess extends ProfileState {
  final EditProfilePicModel editProfilePicModel;

  const EditProfilePicSuccess({required this.editProfilePicModel});
}

final class EditProfilePicFailure extends ProfileState {
  final String errorMessage;

  const EditProfilePicFailure({required this.errorMessage});
}

final class UploadProfilePicLoading extends ProfileState {}

final class UploadProfilePicSuccess extends ProfileState {
  final UplaodProfilePicModel uplaodProfilePicModel;

  const UploadProfilePicSuccess({required this.uplaodProfilePicModel});
}

final class UploadProfilePicFailure extends ProfileState {
  final String errorMessage;

  const UploadProfilePicFailure({required this.errorMessage});
}

final class DeleteUserLoading extends ProfileState {}

final class DeleteUserSuccess extends ProfileState {
  final DeleteUserModel deleteUserModel;

  const DeleteUserSuccess({required this.deleteUserModel});
}

final class DeleteUserFailure extends ProfileState {
  final String errorMessage;

  const DeleteUserFailure({required this.errorMessage});
}

final class GetUserDataLoading extends ProfileState {}

final class GetUserDataSuccess extends ProfileState {
  final UserDataModel userDataModel;

  const GetUserDataSuccess({required this.userDataModel});
}

final class GetUserDataFailure extends ProfileState {
  final String errorMessage;

  const GetUserDataFailure({required this.errorMessage});
}
