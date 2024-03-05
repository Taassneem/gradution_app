import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/food_quiz_view_body_text.dart';
import 'widgets/middle_food_error_widget.dart';
import 'widgets/middle_food_right_message.dart';
import '../../presentation/views/widgets/name_speaker.dart';

class FoodQuizViewFour extends StatelessWidget {
  const FoodQuizViewFour({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const NameSpeaker(),
      ),
      body: FoodQuizViewTextBody(
        answerOne: s.grapes,
        onTapOne: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleFoodErrorWidget();
            },
          );
        },
        answerTwo: s.pumpkin,
        onTapTwo: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleFoodErrorWidget();
            },
          );
        },
        answerThree: s.cherries,
        onTapThree: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleFoodErrorWidget();
            },
          );
        },
        answerFour: s.strawberry,
        onTapFour: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MiddleFoodRightWidget(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.foodQuizViewFive);
                },
              );
            },
          );
        },
        question: AppAssets.strawbery,
      ),
    );
  }
}
