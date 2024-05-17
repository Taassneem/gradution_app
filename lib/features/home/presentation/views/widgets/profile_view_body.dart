import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'custom_logout.dart';
import 'profile_view_informations.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.045.h),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.14.h,
              width: MediaQuery.sizeOf(context).width.w,
              color: AppColor.purple,
              child: Padding(
                padding: EdgeInsets.all(24.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahmed Mahmoud',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Ahmed_Mahmoud@gmail.com ',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10.w,
              top: -10.h,
              child: Container(
                width: 130.w,
                height: 120.h,
                decoration: BoxDecoration(
                    color: AppColor.screenColor,
                    borderRadius: BorderRadius.circular(60.w),
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(AppAssets.model),
                    )),
              ),
            )
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.025.h),
        const ProfileViewInformations(),
        const CustomLogOut()
      ],
    );
  }
}
