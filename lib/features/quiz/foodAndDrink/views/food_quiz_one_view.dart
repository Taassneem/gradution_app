import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/widgets/middle_food_right_message.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/name_speaker.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/food_quiz_view_body_text.dart';
import 'widgets/middle_food_error_widget.dart';

class FoodQuizViewOne extends StatelessWidget {
  const FoodQuizViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const NameSpeaker(),
      ),
      body: FoodQuizViewTextBody(
        answerOne: s.cucumber,
        onTapOne: () {
          customShowDialog(context, widget: const MiddleFoodErrorWidget());
        },
        answerTwo: s.carrot,
        onTapTwo: () {
          customShowDialog(context, widget: const MiddleFoodErrorWidget());
        },
        answerThree: s.corn,
        onTapThree: () {
          customShowDialog(context, widget: const MiddleFoodErrorWidget());
        },
        answerFour: s.tomato,
        onTapFour: () {
          customShowDialog(context,
              widget: MiddleFoodRightWidget(onPressed: () {
            GoRouter.of(context).push(AppRouter.foodQuizViewTwo);
          }));
        },
        question: AppAssets.tomato,
      ),
    );
  }
}
