import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/food_quiz_view_body_images.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/middle_right_message.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/name_speaker.dart';

import 'widgets/middle_error_widget.dart';

class FoodQuizViewTwo extends StatelessWidget {
  const FoodQuizViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const NameSpeaker(),
        ),
        body: FoodQuizViewImageBody(
            answerOne: AppAssets.apple,
            onTapOne: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MiddleErrorWidget();
                },
              );
            },
            answerTwo: AppAssets.banana,
            onTapTwo: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MiddleErrorWidget();
                },
              );
            },
            answerThree: AppAssets.guava,
            onTapThree: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MiddleErrorWidget();
                },
              );
            },
            answerFour: AppAssets.orange,
            onTapFour: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MiddleRightWidget(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.foodQuizViewThree);
                    },
                  );
                },
              );
            },
            question: 'Orange'));
  }
}
