import 'package:flutter/material.dart';

import 'widget/number_quiz_seven_view_body.dart';

class NumberQuizSevenView extends StatelessWidget {
  const NumberQuizSevenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: NumberQuizSevenViewBody()),
    );
  }
}
