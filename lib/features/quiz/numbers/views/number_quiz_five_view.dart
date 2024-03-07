import 'package:flutter/material.dart';

import 'widget/number_quiz_five_view_body.dart';

class NumberQuizFiveView extends StatelessWidget {
  const NumberQuizFiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: NumberQuizFiveNiewBody()),
    );
  }
}
