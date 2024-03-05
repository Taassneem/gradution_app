import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
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
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(AppAssets.quiz)]),
          Expanded(
            child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Row(
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
