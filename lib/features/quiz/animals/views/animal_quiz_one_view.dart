import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/animals/views/widgets/middle_animal_error.dart';
import 'package:gradution_app/features/quiz/animals/views/widgets/middle_animal_right.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'widgets/animal_quiz_image_view_body.dart';

class AnimalQuizOneView extends StatelessWidget {
  const AnimalQuizOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimalQuizImageViewBody(
        question: S.of(context).theCamel,
        imageOne: AppAssets.camal,
        onTapOne: () {
          customShowDialog(context, widget: MiddleAnimalRight(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.animalQuizViewTwo);
            },
          ));
        },
        imageTwo: AppAssets.monkey,
        onTapTwo: () {
          customShowDialog(context, widget: const MiddleAnimalError());
        },
      ),
    );
  }
}
