import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/name_speaker.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_error_widget.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_success_widget.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'package:intl/intl.dart';

import 'number_answer_image.dart';
import 'number_question_circular.dart';

class NumberQuizOneViewBody extends StatelessWidget {
  const NumberQuizOneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          NameSpeaker(isWhite: true, onPressed: () {}),
          const SizedBox(height: 32),
          NumberQuestionCircular(
            question: S.of(context).sum,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
          ImageAnswerNumber(
              number: AppAssets.twelve,
              isWhite: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const NumberErrorWidget();
                  },
                );
              }),
          ImageAnswerNumber(
              number: AppAssets.eleven,
              isWhite: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return NumberSuccessWidget(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.numberQuizViewTwo);
                      },
                    );
                  },
                );
              }),
          ImageAnswerNumber(
              number: AppAssets.ten,
              isWhite: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const NumberErrorWidget();
                  },
                );
              })
        ],
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
