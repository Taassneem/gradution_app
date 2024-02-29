import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';

import 'widgets/food_quiz_view_body_text.dart';
import 'widgets/middle_error_widget.dart';
import 'widgets/middle_right_message.dart';
import 'widgets/name_speaker.dart';

class FoodQuizViewSix extends StatelessWidget {
  const FoodQuizViewSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NameSpeaker(),
      ),
      body:  FoodQuizViewTextBody(
        answerOne: 'pepper',
        onTapOne: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return MiddleRightWidget(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.foodQuizViewSeven);
                  },
                );
              });
        },
        answerTwo: 'eggplant',
        onTapTwo: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleErrorWidget();
            },
          );
        },
        answerThree: 'potato',
        onTapThree: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleErrorWidget();
            },
          );
        },
        answerFour: 'cebola',
        onTapFour: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleErrorWidget();
            },
          );
        },
        question: AppAssets.coloredPapper,
      ),
    );
  }
}
