import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'widgets/upload_photo_view_body.dart';

class UploadPhotoView extends StatelessWidget {
  const UploadPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple,
      appBar: AppBar(
        backgroundColor: AppColor.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(36.0.r),
        child: const UploadPhotoViewBody(),
      ),
    );
  }
}
