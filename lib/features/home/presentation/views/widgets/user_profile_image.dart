import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'custom_modal_bottom_sheet.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
    required this.image,
  });
  final ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return const CustomModalBottomSheetProfilePic(editPhoto: true);
            });
      },
      child: Badge(
        alignment: Alignment.bottomLeft,
        backgroundColor: AppColor.purple,
        label: const Icon(Icons.border_color_outlined),
        largeSize: 30,
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 130.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.w),
            color: AppColor.purple,
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
