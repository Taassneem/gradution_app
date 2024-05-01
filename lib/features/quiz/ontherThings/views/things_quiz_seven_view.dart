import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widget/things_error_widget.dart';
import 'widget/things_quiz_text_view_body.dart';
import 'widget/things_success_widget.dart';

class ThingsQuizSevenView extends StatelessWidget {
  const ThingsQuizSevenView({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
      body: SafeArea(
        child: ThingsQuizTextViewBody(
          question: AppAssets.sunny,
          answerOne: s.windy,
          onTapOne: () {
            customShowDialog(context, widget: const MiddleThingsError());
          },
          answerTwo: s.cloudy,
          onTapTwo: () {
            customShowDialog(context, widget: const MiddleThingsError());
          },
          answerThree: s.sunny,
          onTapThree: () {
            customShowDialog(context, widget: MiddleThingsRight(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.otherThingsQuizViewEight);
              },
            ));
          },
          answerFour: s.snow,
          onTapFour: () {
            customShowDialog(context, widget: const MiddleThingsError());
          },
        ),
      ),
    );
  }
}
