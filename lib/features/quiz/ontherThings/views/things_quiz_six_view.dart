import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widget/things_error_widget.dart';
import 'widget/things_quiz_image_view_body.dart';
import 'widget/things_success_widget.dart';

class ThingsQuizSixView extends StatelessWidget {
  const ThingsQuizSixView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ThingsQuizImageViewBody(
        question: S.of(context).computer,
        answerOne: AppAssets.tv,
        onTapOne: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
        answerTwo: AppAssets.computer,
        onTapTwo: () {
          customShowDialog(context, widget: MiddleThingsRight(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.otherThingsQuizViewSeven);
            },
          ));
        },
        answerThree: AppAssets.phone,
        onTapThree: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
        answerFour: AppAssets.laptop,
        onTapFour: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
      ),
    ));
  }
}
