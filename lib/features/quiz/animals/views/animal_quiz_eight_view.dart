import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleAnimalError();
            },
          );
        },
        answerTwo: s.monkey,
        onTapTwo: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MiddleAnimalRight(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.animalQuizViewNine);
                },
              );
            },
          );
        },
        answerThree: s.fox,
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
