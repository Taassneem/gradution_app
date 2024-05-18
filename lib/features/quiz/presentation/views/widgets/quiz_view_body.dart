import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/widgets/back_icon.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'quiz_item_field.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return SafeArea(
      child: Column(
        children: [
          const BackIcon(),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(AppAssets.quiz)]),
          Expanded(
            child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.only(top: 64.h, right: 8.w, left: 8.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.w),
                        topRight: Radius.circular(100.w)),
                    color: AppColor.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QuizItemField(
                            onTap: () {
                              GoRouter.of(context)
                                  .push(AppRouter.numberQuizViewOne);
                            },
                            image: AppAssets.numbers,
                            title: s.numbers,
                            left: 50),
                        QuizItemField(
                            onTap: () {
                              GoRouter.of(context)
                                  .push(AppRouter.animalQuizViewOne);
                            },
                            image: AppAssets.animals,
                            title: s.animals,
                            paddingLeft: 16,
                            left: 50),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QuizItemField(
                            onTap: () {
                              GoRouter.of(context)
                                  .push(AppRouter.foodQuizViewOne);
                            },
                            image: AppAssets.foodAndDrink,
                            title: s.foodAndDrink,
                            left: 30),
                        QuizItemField(
                            onTap: () {
                              GoRouter.of(context)
                                  .push(AppRouter.otherThingsQuizViewOne);
                            },
                            image: AppAssets.otherThings,
                            title: s.otherThings,
                            paddingLeft: 16,
                            left: 40),
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
