import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';

import 'widgets/food_quiz_view_body_text.dart';
import 'widgets/middle_error_widget.dart';
import 'widgets/middle_right_message.dart';
import 'widgets/name_speaker.dart';

class FoodQuizViewEight extends StatelessWidget {
  const FoodQuizViewEight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NameSpeaker(),
      ),
      body:  FoodQuizViewTextBody(
        answerOne: 'meat',
        onTapOne: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleErrorWidget();
            },
          );
        },
        answerTwo: 'chicken',
        onTapTwo: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleErrorWidget();
            },
          );
        },
        answerThree: 'egg',
        onTapThree: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MiddleRightWidget(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.foodQuizViewNine);
                },
              );
            },
          );
        },
        answerFour: 'salmon',
        onTapFour: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleErrorWidget();
            },
          );
        },
        question: AppAssets.egg,
      ),
    );
  }
}
