import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/animal_quiz_image_view_body.dart';
import 'widgets/middle_animal_error.dart';
import 'widgets/middle_animal_right.dart';

class AnimalQuizSevenView extends StatelessWidget {
  const AnimalQuizSevenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimalQuizImageViewBody(
        question: S.of(context).theLion,
        imageOne: AppAssets.bird2,
        onTapOne: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleAnimalError();
            },
          );
        },
        imageTwo: AppAssets.lion,
        onTapTwo: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MiddleAnimalRight(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.animalQuizViewEight);
                },
              );
            },
          );
        },
      ),
    );
  }
}
