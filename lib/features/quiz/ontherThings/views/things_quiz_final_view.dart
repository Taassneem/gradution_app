import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/quiz_final_congrats.dart';
import 'package:gradution_app/generated/l10n.dart';

class ThingsQuizFinalView extends StatelessWidget {
  const ThingsQuizFinalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizFinalCongrats(
        image: AppAssets.thingsCongrats,
        quiz: S.of(context).congratulationsThings,
      ),
    );
  }
}
