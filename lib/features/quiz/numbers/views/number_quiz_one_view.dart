import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_quiz_image_view_body.dart';

class NumberQuizView extends StatelessWidget {
  const NumberQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.babyBlue,
      body: SafeArea(child: NumberQuizOneViewBody()),
    );
  }
}
