import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/quiz_final_congrats.dart';
import 'package:gradution_app/generated/l10n.dart';

class AnimalQuizFinalView extends StatelessWidget {
  const AnimalQuizFinalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizFinalCongrats(
        image: AppAssets.animalCongrats,
        quiz: S.of(context).congratulationsAnimal,
      ),
    );
  }
}
