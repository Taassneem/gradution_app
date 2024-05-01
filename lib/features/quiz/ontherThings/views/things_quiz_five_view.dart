import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
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
          customShowDialog(context, widget: const MiddleThingsError());
        },
        answerTwo: AppAssets.eraser,
        onTapTwo: () {
          customShowDialog(context, widget: MiddleThingsRight(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.otherThingsQuizViewSix);
            },
          ));
        },
        answerThree: AppAssets.pencil,
        onTapThree: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
        answerFour: AppAssets.ruler,
        onTapFour: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
      ),
    ));
  }
}
