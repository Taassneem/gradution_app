import 'package:flutter/material.dart';
import 'package:gradution_app/features/choose/views/widgets/choose_view_body.dart';

class ChooseView extends StatelessWidget {
  const ChooseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: ChooseViewBody()),
    );
  }
}
