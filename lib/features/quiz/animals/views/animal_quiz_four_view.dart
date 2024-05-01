import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/animal_quiz_text_body.dart';
import 'widgets/middle_animal_error.dart';
import 'widgets/middle_animal_right.dart';

class AnimalQuizFourView extends StatelessWidget {
  const AnimalQuizFourView({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
      body: AnimalQuizTextViewBody(
        question: AppAssets.cow,
        answerOne: s.elephant,
        onTapOne: () {
          customShowDialog(context, widget: const MiddleAnimalError());
        },
        answerTwo: s.lemure,
        onTapTwo: () {
          customShowDialog(context, widget: const MiddleAnimalError());
        },
        answerThree: s.cow,
        onTapThree: () {
          customShowDialog(context, widget: MiddleAnimalRight(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.animalQuizViewFive);
            },
          ));
        },
      ),
    );
  }
}
