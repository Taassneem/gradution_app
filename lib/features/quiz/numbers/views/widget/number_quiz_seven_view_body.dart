import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'name_speaker.dart';
import 'number_error_widget.dart';
import 'number_success_widget.dart';
import 'number_text_answer.dart';

class NumberQuizSevenViewBody extends StatelessWidget {
  const NumberQuizSevenViewBody({
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
          TextAnswerNumber(number: S.of(context).four, question: true),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
          Row(
            children: [
              TextAnswerNumber(
                  answerImage: true,
                  image: AppAssets.no,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const NumberErrorWidget();
                      },
                    );
                  }),
              TextAnswerNumber(
                  answerImage: true,
                  image: AppAssets.ou,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return NumberSuccessWidget(
                          onPressed: () {
                            GoRouter.of(context)
                                .push(AppRouter.numberQuizViewEight);
                          },
                        );
                      },
                    );
                  }),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
          Row(
            children: [
              TextAnswerNumber(
                  answerImage: true,
                  image: AppAssets.uv,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const NumberErrorWidget();
                      },
                    );
                  }),
              TextAnswerNumber(
                  answerImage: true,
                  image: AppAssets.uo,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const NumberErrorWidget();
                      },
                    );
                  }),
            ],
          )
        ],
      ),
    );
  }
}
