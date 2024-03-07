import 'package:flutter/material.dart';

import 'widget/number_quiz_two_view_body.dart';

class NumberQuizTwoView extends StatelessWidget {
  const NumberQuizTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: NumberQuizTwoViewBody()));
  }
}
