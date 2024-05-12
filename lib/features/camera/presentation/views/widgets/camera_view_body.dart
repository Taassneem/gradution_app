import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';

import 'camera_feature.dart';

class CameraViewBody extends StatelessWidget {
  const CameraViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppAssets.robot),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.1.h),
        const CameraFeature()
      ],
    );
  }
}
