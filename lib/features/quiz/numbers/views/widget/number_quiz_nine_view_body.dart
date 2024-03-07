import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_question.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'name_speaker.dart';
import 'number_answer_image.dart';
import 'number_error_widget.dart';
import 'number_success_widget.dart';

class NumberQuizNineViewBody extends StatelessWidget {
  const NumberQuizNineViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.monkeies), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            NameSpeaker(onPressed: () {}),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
            NumberQuestion(question: S.of(context).howManyAnimalsInPicture),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            ImageAnswerNumber(
                number: AppAssets.five,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const NumberErrorWidget();
                    },
                  );
                }),
            ImageAnswerNumber(
                number: AppAssets.four,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return NumberSuccessWidget(
                        onPressed: () {
                          GoRouter.of(context)
                              .push(AppRouter.numberQuizViewFinal);
                        },
                      );
                    },
                  );
                }),
            ImageAnswerNumber(
                number: AppAssets.six2,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const NumberErrorWidget();
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
