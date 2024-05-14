import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'item_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.topHome),
          ],
        ),
        Container(
          width: 375.w,
          decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColor.purple, width: 2.w),
              ),
              borderRadius: BorderRadius.circular(100.w)),
          child: Padding(
            padding: EdgeInsets.only(top: 55.0.h, left: 12.w, right: 12.w),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  ItemField(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.cameraView);
                    },
                    color: AppColor.purple,
                    fieldName: S.of(context).camera,
                    image: AppAssets.robotWithCamera,
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    children: [
                      ItemField(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.quizView);
                        },
                        color: AppColor.babyBlue,
                        fieldName: S.of(context).quiz,
                        image: AppAssets.quiz,
                        height: 170.h,
                      ),
                      SizedBox(height: 16.h),
                      ItemField(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.taskView);
                        },
                        color: AppColor.pink,
                        fieldName: S.of(context).task,
                        image: AppAssets.task,
                        height: 180.h,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
