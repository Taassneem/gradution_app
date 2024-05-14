import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'upload_photo_feature.dart';

class UploadPhotoViewBody extends StatelessWidget {
  const UploadPhotoViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppAssets.chatgpt),
        BlocProvider.of<CameraCubit>(context).imageFromGallery == null
            ? Container(
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height * 0.3.h,
                width: MediaQuery.sizeOf(context).width * 0.7.w,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(20.w)),
                child: Image.asset(AppAssets.addImage),
              )
            : Container(
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height * 0.3.h,
                width: MediaQuery.sizeOf(context).width * 0.7.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(
                          BlocProvider.of<CameraCubit>(context)
                              .imageFromGallery!
                              .path)),
                    ),
                    borderRadius: BorderRadius.circular(20.w)),
              ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.06.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UploadPhotoFeature(
                feature: S.of(context).send,
                onTap: () {
                  GoRouter.of(context).push(AppRouter.photoInforamtion);
                }),
            BlocConsumer<CameraCubit, CameraState>(
              listener: (context, state) {
                if (state is CameraGallerySuccess) {
                  showToast(S.of(context).photoUploadSuccessfully);
                } else if (state is CameraGalleryFailure) {
                  log(state.errorMessage);
                }
              },
              builder: (context, state) {
                return UploadPhotoFeature(
                  feature: S.of(context).uploadPhoto,
                  horizontal: 35,
                  onTap: () {
                    BlocProvider.of<CameraCubit>(context)
                        .pickImageWithGallery();
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
