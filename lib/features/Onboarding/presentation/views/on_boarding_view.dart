import 'package:flutter/material.dart';
import 'widget/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingViewBody(controller: controller),
    );
  }
}
