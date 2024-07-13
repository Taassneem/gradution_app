import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/animal_quiz_text_body.dart';
import 'widgets/middle_animal_error.dart';
import 'widgets/middle_animal_right.dart';

class AnimalQuizEightView extends StatelessWidget {
  const AnimalQuizEightView({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
      body: AnimalQuizTextViewBody(
        question: AppAssets.monkey2,
        answerOne: s.bear,
        onTapOne: () {
          customShowDialog(context, widget: const MiddleAnimalError());
        },
        answerTwo: s.monkey,
        onTapTwo: () {
          customShowDialog(context, widget: MiddleAnimalRight(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.animalQuizViewNine);
            },
          ));
        },
        answerThree: s.fox,
        onTapThree: () {
          customShowDialog(context, widget: const MiddleAnimalError());
        },
      ),
    );
  }
}
