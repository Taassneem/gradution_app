import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/widgets/food_quiz_view_body_images.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/middle_food_error_widget.dart';
import 'widgets/middle_food_right_message.dart';

class FoodQuizViewNine extends StatelessWidget {
  const FoodQuizViewNine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FoodQuizViewImageBody(
            answerOne: AppAssets.friuts,
            onTapOne: () {
              customShowDialog(context, widget: const MiddleFoodErrorWidget());
            },
            answerTwo: AppAssets.cake,
            onTapTwo: () {
              customShowDialog(context,
                  widget: MiddleFoodRightWidget(onPressed: () {
                GoRouter.of(context).push(AppRouter.foodQuizViewFinal);
              }));
            },
            answerThree: AppAssets.burger,
            onTapThree: () {
              customShowDialog(context, widget: const MiddleFoodErrorWidget());
            },
            answerFour: AppAssets.pizza,
            onTapFour: () {
              customShowDialog(context, widget: const MiddleFoodErrorWidget());
            },
            question: S.of(context).cake));
  }
}
