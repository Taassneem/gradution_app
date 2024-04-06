import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';

import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
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
                ImageFeatures(
                  image: AppAssets.camera,
                  type: S.of(context).takePhoto,
                ),
                ImageFeatures(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.uploadPhotoView);
                  },
                  image: AppAssets.cloud,
                  type: S.of(context).uploadPhoto,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
