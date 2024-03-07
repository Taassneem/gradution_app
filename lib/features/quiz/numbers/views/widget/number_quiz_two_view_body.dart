import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/name_speaker.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'package:intl/intl.dart';

import 'number_answer_image.dart';
import 'number_error_widget.dart';
import 'number_question.dart';
import 'number_success_widget.dart';

class NumberQuizTwoViewBody extends StatelessWidget {
  const NumberQuizTwoViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.fireworks))),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            NameSpeaker(onPressed: () {}),
            const SizedBox(height: 32),
            NumberQuestion(
              question: S.of(context).meaningOfSeven,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
            Row(
              children: [
                ImageAnswerNumber(
                    number: AppAssets.six,
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
                    number: AppAssets.seven,
                    isWhite: true,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return NumberSuccessWidget(
                            onPressed: () {
                              GoRouter.of(context)
                                  .push(AppRouter.numberQuizViewThree);
                            },
                          );
                        },
                      );
                    }),
                ImageAnswerNumber(
                    number: AppAssets.nine,
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
            )
          ],
        ),
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
