import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'image_features.dart';

class PhotoFromCamera extends StatelessWidget {
  const PhotoFromCamera({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraCubit, CameraState>(
      listener: (context, state) {
        if (state is CameraSuccess) {
          BlocProvider.of<CameraCubit>(context).sendPhoto();
          GoRouter.of(context).push(AppRouter.photoInforamtion);
        } else if (state is CameraFailure) {
          log(state.errorMessage);
        }
      },
      builder: (context, state) {
        return ImageFeatures(
          image: AppAssets.camera,
          type: S.of(context).takePhoto,
          onTap: () {
            BlocProvider.of<CameraCubit>(context).pickImageWithCamera();
          },
        );
      },
    );
  }
}
