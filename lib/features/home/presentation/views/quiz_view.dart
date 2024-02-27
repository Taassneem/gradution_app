import 'package:flutter/material.dart';
import 'package:gradution_app/features/home/presentation/views/widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuizViewBody(),
    );
  }
}