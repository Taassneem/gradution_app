import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';

import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'image_features.dart';

class CameraFeature extends StatelessWidget {
  const CameraFeature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.32,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 8,
              width: 50,
              decoration: BoxDecoration(
                  color: AppColor.purple,
                  borderRadius: BorderRadius.circular(5)),
            ),
            Text(
              S.of(context).whatCanIDoForYou,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocConsumer<CameraCubit, CameraState>(
                  listener: (context, state) {
                    if (state is CameraSuccess) {
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
                        BlocProvider.of<CameraCubit>(context)
                            .pickImageWithCamera();
                      },
                    );
                  },
                ),
                BlocConsumer<CameraCubit, CameraState>(
                  listener: (context, state) {
                    if (state is CameraGallerySuccess) {
                      GoRouter.of(context).push(AppRouter.photoInforamtion);
                    } else if (state is CameraGalleryFailure) {
                      log(state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    return ImageFeatures(
                      onTap: () {
                        BlocProvider.of<CameraCubit>(context)
                            .pickImageWithGallery();
                      },
                      image: AppAssets.cloud,
                      type: S.of(context).uploadPhoto,
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
