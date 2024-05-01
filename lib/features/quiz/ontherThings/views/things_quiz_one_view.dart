import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widget/things_error_widget.dart';
import 'widget/things_quiz_text_view_body.dart';
import 'widget/things_success_widget.dart';

class OtherThingsQuizView extends StatelessWidget {
  const OtherThingsQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
      body: SafeArea(
        child: ThingsQuizTextViewBody(
          question: AppAssets.triangle,
          answerOne: s.star,
          onTapOne: () {
            customShowDialog(context, widget: const MiddleThingsError());
          },
          answerTwo: s.circle,
          onTapTwo: () {
            customShowDialog(context, widget: const MiddleThingsError());
          },
          answerThree: s.triangle,
          onTapThree: () {
            customShowDialog(context, widget: MiddleThingsRight(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.otherThingsQuizViewTwo);
              },
            ));
          },
          answerFour: s.rectangle,
          onTapFour: () {
            customShowDialog(context, widget: const MiddleThingsError());
          },
        ),
      ),
    );
  }
}
