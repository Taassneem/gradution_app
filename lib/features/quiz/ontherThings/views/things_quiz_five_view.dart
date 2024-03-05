import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widget/things_error_widget.dart';
import 'widget/things_quiz_image_view_body.dart';
import 'widget/things_success_widget.dart';

class ThingsQuizFiveView extends StatelessWidget {
  const ThingsQuizFiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ThingsQuizImageViewBody(
        question: S.of(context).theEraser,
        answerOne: AppAssets.sharpner,
        onTapOne: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleThingsError();
            },
          );
        },
        answerTwo: AppAssets.eraser,
        onTapTwo: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MiddleThingsRight(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.otherThingsQuizViewSix);
                },
              );
            },
          );
        },
        answerThree: AppAssets.pencil,
        onTapThree: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleThingsError();
            },
          );
        },
        answerFour: AppAssets.ruler,
        onTapFour: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleThingsError();
            },
          );
        },
      ),
    ));
  }
}
