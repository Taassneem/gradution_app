import 'package:flutter/material.dart';

import 'widget/number_quiz_six_view_body.dart';

class NumberQuizSixView extends StatelessWidget {
  const NumberQuizSixView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: NumberQuizSixViewBody()),
    );
  }
}
