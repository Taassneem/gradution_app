import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/animals/views/widgets/animal_quiz_text_body.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/middle_animal_error.dart';
import 'widgets/middle_animal_right.dart';

class AnimalQuizTwoView extends StatelessWidget {
  const AnimalQuizTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
      body: AnimalQuizTextViewBody(
        question: AppAssets.cat,
        answerOne: s.turtle,
        onTapOne: () {
          customShowDialog(context, widget: const MiddleAnimalError());
        },
        answerTwo: s.camel,
        onTapTwo: () {
          customShowDialog(context, widget: const MiddleAnimalError());
        },
        answerThree: s.cat,
        onTapThree: () {
          customShowDialog(context, widget: MiddleAnimalRight(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.animalQuizViewThree);
            },
          ));
        },
      ),
    );
  }
}
