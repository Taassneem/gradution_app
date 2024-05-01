import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widget/things_error_widget.dart';
import 'widget/things_quiz_image_view_body.dart';
import 'widget/things_success_widget.dart';

class ThingsQuizThreeView extends StatelessWidget {
  const ThingsQuizThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ThingsQuizImageViewBody(
        question: S.of(context).theShip,
        answerOne: AppAssets.motor,
        onTapOne: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
        answerThree: AppAssets.ship,
        onTapThree: () {
          customShowDialog(context, widget: MiddleThingsRight(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.otherThingsQuizViewFour);
            },
          ));
        },
        answerTwo: AppAssets.car,
        onTapTwo: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
        answerFour: AppAssets.bus,
        onTapFour: () {
          customShowDialog(context, widget: const MiddleThingsError());
        },
      ),
    ));
  }
}
