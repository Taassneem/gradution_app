import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/widgets/custom_text_shimmer.dart';
import 'package:gradution_app/features/camera/presentation/views/widgets/image_features.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'custom_logout.dart';
import 'profile_view_informations.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.0.r),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CustomModalBottomSheetProfilePic(
                      profileCubit: profileCubit);
                },
              );
            },
            child: profileCubit.imageFromGallery == null
                ? Badge(
                    label: const Icon(Icons.add, color: AppColor.lightGrey),
                    alignment: Alignment.bottomLeft,
                    backgroundColor: AppColor.purple,
                    padding: EdgeInsets.all(5.r),
                    largeSize: 35,
                    child: Container(
                      width: 130.w,
                      height: 125.h,
                      decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(55.w),
                          image: const DecorationImage(
                              image: AssetImage(AppAssets.profilePic),
                              fit: BoxFit.cover)),
                    ),
                  )
                : Container(
                    width: 130.w,
                    height: 125.h,
                    decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        borderRadius: BorderRadius.circular(55.w),
                        image: DecorationImage(
                            image: FileImage(
                                File(profileCubit.imageFromGallery!.path)),
                            fit: BoxFit.cover)),
                  ),
          ),
        ),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is GetUserDataSuccess) {
              return Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.userDataModel.user!.userName!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      state.userDataModel.user!.email!,
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              );
            } else if (state is GetUserDataFailure) {
              return showToast(state.errorMessage);
            } else {
              return Column(
                children: [
                  const CustomTextShimmer(),
                  SizedBox(height: 8.h),
                  const CustomTextShimmer(),
                ],
              );
            }
          },
        ),
        const ProfileViewInformations(),
        const CustomLogOut()
      ],
    );
  }
}

class CustomModalBottomSheetProfilePic extends StatelessWidget {
  const CustomModalBottomSheetProfilePic({
    super.key,
    required this.profileCubit,
  });

  final ProfileCubit profileCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is PickProfileFromCameraSuccess) {
                    profileCubit.uploadProfilepic();
                    GoRouter.of(context).pop();
                  } else if (state is PickProfileFromCameraFailure) {
                    showToast(state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return ImageFeatures(
                    image: AppAssets.camera,
                    type: S.of(context).takePhoto,
                    onTap: () {
                      profileCubit.pickImageWithCamera();
                    },
                  );
                },
              ),
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is PickProfileFromGallerySuccess) {
                    profileCubit.uploadProfilepic();
                    GoRouter.of(context).pop();
                  } else if (state is PickProfileFromGalleryFailure) {
                    showToast(state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return ImageFeatures(
                    onTap: () {
                      profileCubit.pickImageWithGallery();
                    },
                    image: AppAssets.cloud,
                    type: S.of(context).uploadPhoto,
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
