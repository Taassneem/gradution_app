import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_quiz_four_view_body.dart';

class NumberQuizFourView extends StatelessWidget {
  const NumberQuizFourView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(18.r),
        child: const NumberQuizFourViewBody(),
      )),
    );
  }
}
