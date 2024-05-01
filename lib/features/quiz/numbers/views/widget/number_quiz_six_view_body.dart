import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/name_speaker.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_text_answer.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'number_answer_image.dart';
import 'number_error_widget.dart';
import 'number_success_widget.dart';

class NumberQuizSixViewBody extends StatelessWidget {
  const NumberQuizSixViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          NameSpeaker(onPressed: () {}),
          const SizedBox(height: 32),
          TextAnswerNumber(number: S.of(context).six, question: true),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
          ImageAnswerNumber(
              number: AppAssets.three,
              onTap: () {
                customShowDialog(context, widget: const NumberErrorWidget());
              }),
          ImageAnswerNumber(
              number: AppAssets.six2,
              onTap: () {
                customShowDialog(context, widget: NumberSuccessWidget(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.numberQuizViewSeven);
                  },
                ));
              }),
          ImageAnswerNumber(
              number: AppAssets.four,
              onTap: () {
                customShowDialog(context, widget: const NumberErrorWidget());
              }),
        ],
      ),
    );
  }
}
