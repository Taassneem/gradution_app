import 'package:flutter/material.dart';
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
      body: const Padding(
        padding: EdgeInsets.all(36.0),
        child: UploadPhotoViewBody(),
      ),
    );
  }
}
