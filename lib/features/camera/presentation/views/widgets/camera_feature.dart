import 'package:flutter/material.dart';

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
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.32,
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(20)),
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
