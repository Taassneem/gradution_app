import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widget/things_error_widget.dart';
import 'widget/things_quiz_image_view_body.dart';
import 'widget/things_success_widget.dart';

class ThingsQuizNineView extends StatelessWidget {
  const ThingsQuizNineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ThingsQuizImageViewBody(
        question: S.of(context).watch,
        answerOne: AppAssets.clean,
        onTapOne: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleThingsError();
            },
          );
        },
        answerTwo: AppAssets.watch,
        onTapTwo: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MiddleThingsRight(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.otherThingsQuizViewTen);
                },
              );
            },
          );
        },
        answerThree: AppAssets.swim,
        onTapThree: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const MiddleThingsError();
            },
          );
        },
        answerFour: AppAssets.teethBrush,
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
