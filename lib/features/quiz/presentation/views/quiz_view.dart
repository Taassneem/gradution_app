import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.babyBlue,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.homeView);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: AppColor.babyBlue,
      body: const QuizViewBody(),
    );
  }
}
