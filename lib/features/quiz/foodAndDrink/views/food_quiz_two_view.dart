import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/widgets/food_quiz_view_body_images.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/widgets/middle_food_right_message.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/name_speaker.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/middle_food_error_widget.dart';

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
              customShowDialog(context, widget: const MiddleFoodErrorWidget());
            },
            answerTwo: AppAssets.banana,
            onTapTwo: () {
              customShowDialog(context, widget: const MiddleFoodErrorWidget());
            },
            answerThree: AppAssets.guava,
            onTapThree: () {
              customShowDialog(context, widget: const MiddleFoodErrorWidget());
            },
            answerFour: AppAssets.orange,
            onTapFour: () {
              customShowDialog(context, widget: MiddleFoodRightWidget(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.foodQuizViewThree);
                },
              ));
            },
            question: S.of(context).orange));
  }
}
