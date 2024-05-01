import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widget/things_error_widget.dart';
import 'widget/things_quiz_image_view_body.dart';
import 'widget/things_success_widget.dart';

class ThingsQuizEightView extends StatelessWidget {
  const ThingsQuizEightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ThingsQuizImageViewBody(
        question: S.of(context).sad,
        answerOne: AppAssets.happy,
        onTapOne: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
        answerFour: AppAssets.sad,
        onTapFour: () {
          customShowDialog(context, widget: MiddleThingsRight(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.otherThingsQuizViewNine);
            },
          ));
        },
        answerThree: AppAssets.angry,
        onTapThree: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
        answerTwo: AppAssets.pleasure,
        onTapTwo: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
      ),
    ));
  }
}
