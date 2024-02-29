import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/middle_right_message.dart';

import 'widgets/food_quiz_view_body_text.dart';
import 'widgets/middle_error_widget.dart';
import 'widgets/name_speaker.dart';

class FoodQuizViewOne extends StatelessWidget {
  const FoodQuizViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NameSpeaker(),
      ),
      body: FoodQuizViewTextBody(
        answerOne: 'Cucumber',
        onTapOne: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleErrorWidget();
            },
          );
        },
        answerTwo: 'Carrot',
        onTapTwo: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleErrorWidget();
            },
          );
        },
        answerThree: 'Corn',
        onTapThree: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleErrorWidget();
            },
          );
        },
        answerFour: 'Tomato',
        onTapFour: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MiddleRightWidget(onPressed: () {
                GoRouter.of(context).push(AppRouter.foodQuizViewTwo);
              });
            },
          );
        },
        question: AppAssets.tomato,
      ),
    );
  }
}
