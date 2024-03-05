import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/animals/views/widgets/animal_quiz_text_body.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/middle_animal_error.dart';
import 'widgets/middle_animal_right.dart';

class AnimalQuizSixView extends StatelessWidget {
  const AnimalQuizSixView({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
      body: AnimalQuizTextViewBody(
        question: AppAssets.elephent,
        answerOne: s.elephant,
        onTapOne: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MiddleAnimalRight(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.animalQuizViewSeven);
                },
              );
            },
          );
        },
        answerTwo: s.camel,
        onTapTwo: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleAnimalError();
            },
          );
        },
        answerThree: s.emu,
        onTapThree: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleAnimalError();
            },
          );
        },
      ),
    );
  }
}
