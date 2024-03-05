import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/widgets/food_quiz_view_body_images.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/name_speaker.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/middle_food_error_widget.dart';
import 'widgets/middle_food_right_message.dart';

class FoodQuizViewFive extends StatelessWidget {
  const FoodQuizViewFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const NameSpeaker(),
        ),
        body: FoodQuizViewImageBody(
            answerOne: AppAssets.cheese,
            onTapOne: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MiddleFoodErrorWidget();
                },
              );
            },
            answerFour: AppAssets.meat,
            onTapFour: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MiddleFoodErrorWidget();
                },
              );
            },
            answerThree: AppAssets.fish,
            onTapThree: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MiddleFoodRightWidget(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.foodQuizViewSix);
                      },
                    );
                  });
            },
            answerTwo: AppAssets.chicken,
            onTapTwo: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MiddleFoodErrorWidget();
                },
              );
            },
            question: S.of(context).fish));
  }
}
