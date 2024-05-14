import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'widgets/camera_view_body.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple,
      appBar: AppBar(
        backgroundColor: AppColor.purple,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(24.0.r),
        child: const CameraViewBody(),
      )),
    );
  }
}
