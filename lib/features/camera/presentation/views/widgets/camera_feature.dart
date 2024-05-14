import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'photo_from_camera.dart';
import 'photo_from_gallery.dart';

class CameraFeature extends StatelessWidget {
  const CameraFeature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width.w,
      height: MediaQuery.sizeOf(context).height * 0.32.h,
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(20.w)),
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 8.h,
              width: 50.w,
              decoration: BoxDecoration(
                  color: AppColor.purple,
                  borderRadius: BorderRadius.circular(5.w)),
            ),
            Text(
              S.of(context).whatCanIDoForYou,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PhotoFromCamera(),
                PhotoFromGallery(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
