import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/food_quiz_view_body_text.dart';
import 'widgets/middle_food_error_widget.dart';
import 'widgets/middle_food_right_message.dart';

class FoodQuizViewEight extends StatelessWidget {
  const FoodQuizViewEight({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
      body: FoodQuizViewTextBody(
        answerOne: s.meat,
        onTapOne: () {
          customShowDialog(context, widget: const MiddleFoodErrorWidget());
        },
        answerTwo: s.chicken,
        onTapTwo: () {
          customShowDialog(context, widget: const MiddleFoodErrorWidget());
        },
        answerThree: s.egg,
        onTapThree: () {
          customShowDialog(context, widget: MiddleFoodRightWidget(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.foodQuizViewNine);
            },
          ));
        },
        answerFour: s.salmon,
        onTapFour: () {
          customShowDialog(context, widget: const MiddleFoodErrorWidget());
        },
        question: AppAssets.egg,
      ),
    );
  }
}
