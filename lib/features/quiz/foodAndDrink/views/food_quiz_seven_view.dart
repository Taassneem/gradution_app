import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/food_quiz_view_body_text.dart';
import 'widgets/middle_food_error_widget.dart';
import 'widgets/middle_food_right_message.dart';

class FoodQuizViewSeven extends StatelessWidget {
  const FoodQuizViewSeven({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
      body: FoodQuizViewTextBody(
        answerOne: s.water,
        onTapOne: () {
          customShowDialog(context, widget: const MiddleFoodErrorWidget());
        },
        answerTwo: s.milk,
        onTapTwo: () {
          customShowDialog(context, widget: MiddleFoodRightWidget(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.foodQuizViewEight);
            },
          ));
        },
        answerThree: s.coffee,
        onTapThree: () {
          customShowDialog(context, widget: const MiddleFoodErrorWidget());
        },
        answerFour: s.tea,
        onTapFour: () {
          customShowDialog(context, widget: const MiddleFoodErrorWidget());
        },
        question: AppAssets.milk,
      ),
    );
  }
}
