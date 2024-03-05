import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/widgets/quiz_final_congrats.dart';

class ThingsQuizFinalView extends StatelessWidget {
  const ThingsQuizFinalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuizFinalCongrats(
        image: AppAssets.thingsCongrats,
      ),
    );
  }
}