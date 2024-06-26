import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widget/number_error_widget.dart';
import 'widget/number_quiz_hexagon_shape.dart';
import 'widget/number_success_widget.dart';

class NumberQuizThreeView extends StatelessWidget {
  const NumberQuizThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.babyBlue,
      body: SafeArea(
          child: NumberQuizHexagonShape(
        question: S.of(context).multi,
        numberOne: '19',
        onTapOne: () {
          customShowDialog(context, widget: const NumberErrorWidget());
        },
        numberTwo: '10',
        onTapTwo: () {
          customShowDialog(context, widget: const NumberErrorWidget());
        },
        numberFive: '16',
        onTapFive: () {
          customShowDialog(context, widget: const NumberErrorWidget());
        },
        numberFour: '11',
        onTapFour: () {
          customShowDialog(context, widget: const NumberErrorWidget());
        },
        numberThree: '14',
        onTapThree: () {
          customShowDialog(context, widget: NumberSuccessWidget(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.numberQuizViewFour);
            },
          ));
        },
        numberSix: '13',
        onTapSix: () {
          customShowDialog(context, widget: const NumberErrorWidget());
        },
      )),
    );
  }
}
