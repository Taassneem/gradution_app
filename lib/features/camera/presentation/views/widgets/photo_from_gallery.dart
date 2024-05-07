import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'image_features.dart';

class PhotoFromGallery extends StatelessWidget {
  const PhotoFromGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraCubit, CameraState>(
      listener: (context, state) {
        if (state is CameraGallerySuccess) {
          BlocProvider.of<CameraCubit>(context).sendPhoto();
          GoRouter.of(context).push(AppRouter.photoInforamtion);
        } else if (state is CameraGalleryFailure) {
          showToast(state.errorMessage, task: true);
          log(state.errorMessage);
        }
      },
      builder: (context, state) {
        return ImageFeatures(
          onTap: () {
            BlocProvider.of<CameraCubit>(context).pickImageWithGallery();
          },
          image: AppAssets.cloud,
          type: S.of(context).uploadPhoto,
        );
      },
    );
  }
}
