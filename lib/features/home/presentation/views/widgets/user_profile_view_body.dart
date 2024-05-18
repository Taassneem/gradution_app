import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/widgets/custom_elevated_button.dart';
import 'package:gradution_app/core/utils/widgets/custom_text_field_shimmer.dart';
import 'package:gradution_app/features/auth/presentation/views/widgets/text_with_text_field.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

import 'change_password_button.dart';
import 'delete_account_button.dart';
import 'user_profile_image.dart';

class UserProfileViewBody extends StatelessWidget {
  const UserProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Padding(
      padding: EdgeInsets.all(18.0.r),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is EditProfileSuccess) {
            showToast(state.editProfileModel.message!);
          } else if (state is EditProfileFailure) {
            showToast(state.errorMessage);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is GetUserDataSuccess) {
                    return Column(
                      children: [
                        UserProfileImage(
                          image: NetworkImage(
                              state.userDataModel.user!.profilePic!.secureUrl!),
                        ),
                        TextWithTextField(
                          controller: profileCubit.editUserName,
                          textFieldName: S.of(context).fullName,
                          hintText: state.userDataModel.user!.userName!,
                          userProfile: true,
                          icon: Icons.border_color_outlined,
                        ),
                        SizedBox(height: 24.h),
                        TextWithTextField(
                          controller: profileCubit.editEmail,
                          textFieldName: S.of(context).email,
                          hintText: state.userDataModel.user!.email!,
                          userProfile: true,
                          icon: Icons.border_color_outlined,
                          finalField: true,
                        ),
                      ],
                    );
                  } else if (state is GetUserDataFailure) {
                    return showToast(state.errorMessage);
                  } else {
                    return const EditProfileShimmer();
                  }
                },
              ),
              SizedBox(height: 24.h),
              const ChangePasswordButton(),
              SizedBox(height: 24.h),
              const DeleteAccountButton(),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                text: S.of(context).saveChanges,
                onPressed: () {
                  if (profileCubit.editProfileKey.currentState!.validate()) {
                    profileCubit.editProfile();
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }
}

class EditProfileShimmer extends StatelessWidget {
  const EditProfileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.w),
          ),
          child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.circular(10.w)),
              )),
        ),
        CustomTextFieldShimmer(textFieldName: S.of(context).fullName),
        SizedBox(height: 24.h),
        CustomTextFieldShimmer(textFieldName: S.of(context).email)
      ],
    );
  }
}
