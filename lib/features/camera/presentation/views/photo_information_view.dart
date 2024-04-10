import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'widgets/photo_information_view_body.dart';

class PhotoInformationView extends StatelessWidget {
  const PhotoInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.purple,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.0),
        child: PhotoInforamtionViewBody(),
      ),
    );
  }
}
