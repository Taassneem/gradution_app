import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/app_string.dart';

import 'item_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.topHome),
          ],
        ),
        Container(
          width: 375,
          decoration: BoxDecoration(
              border: const Border(
                top: BorderSide(color: AppColor.purple, width: 2),
              ),
              borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.only(top: 55.0, left: 12, right: 12),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  ItemField(
                    color: AppColor.purple,
                    fieldName: AppString.camera,
                    image: AppAssets.camera,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      ItemField(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.quizView);
                        },
                        color: AppColor.babyBlue,
                        fieldName: AppString.quiz,
                        image: AppAssets.quiz,
                        height: 170,
                      ),
                      const SizedBox(height: 16),
                      ItemField(
                        color: AppColor.pink,
                        fieldName: AppString.task,
                        image: AppAssets.task,
                        height: 180,
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
