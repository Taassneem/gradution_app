import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
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
        Container(
          alignment: Alignment.center,
          height: MediaQuery.sizeOf(context).height * 0.3,
          width: MediaQuery.sizeOf(context).width * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Image.asset(AppAssets.addImage),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UploadPhotoFeature(
                feature: S.of(context).send,
                onTap: () {
                  GoRouter.of(context).push(AppRouter.photoInforamtion);
                }),
            UploadPhotoFeature(
              feature: S.of(context).uploadPhoto,
              horizontal: 35,
            ),
          ],
        )
      ],
    );
  }
}
