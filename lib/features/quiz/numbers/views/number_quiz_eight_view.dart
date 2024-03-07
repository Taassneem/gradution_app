import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widget/number_error_widget.dart';
import 'widget/number_quiz_hexagon_shape.dart';
import 'widget/number_success_widget.dart';

class NumberQuizEightView extends StatelessWidget {
  const NumberQuizEightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.babyBlue,
      body: SafeArea(
          child: NumberQuizHexagonShape(
            question: S.of(context).sub,
        numberOne: '21',
        onTapOne: () {
          showDialog(
            context: context,
            builder: (context) {
              return const NumberErrorWidget();
            },
          );
        },
        numberTwo: '12',
        onTapTwo: () {
          showDialog(
            context: context,
            builder: (context) {
              return const NumberErrorWidget();
            },
          );
        },
        numberThree: '10',
        onTapThree: () {
          showDialog(
            context: context,
            builder: (context) {
              return const NumberErrorWidget();
            },
          );
        },
        numberFour: '11',
        onTapFour: () {
          showDialog(
            context: context,
            builder: (context) {
              return const NumberErrorWidget();
            },
          );
        },
        numberFive: '9',
        isOneNumberFive: true,
        onTapFive: () {
          showDialog(
            context: context,
            builder: (context) {
              return NumberSuccessWidget(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.numberQuizViewNine);
                },
              );
            },
          );
        },
        numberSix: '6',
        isOneNumberSix: true,
        onTapSix: () {
          showDialog(
            context: context,
            builder: (context) {
              return const NumberErrorWidget();
            },
          );
        },
      )),
    );
  }
}
