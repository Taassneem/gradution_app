import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/animal_quiz_image_view_body.dart';
import 'widgets/middle_animal_error.dart';
import 'widgets/middle_animal_right.dart';

class AnimalQuizNineView extends StatelessWidget {
  const AnimalQuizNineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimalQuizImageViewBody(
        question: S.of(context).theSnake,
        imageOne: AppAssets.hourse,
        onTapOne: () {
          customShowDialog(context, widget: const MiddleAnimalError());
        },
        imageTwo: AppAssets.snake,
        onTapTwo: () {
          customShowDialog(context, widget: MiddleAnimalRight(
            onPressed: () {
              GoRouter.of(context)
                  .pushReplacement(AppRouter.animalQuizViewFinal);
            },
          ));
        },
      ),
    );
  }
}
