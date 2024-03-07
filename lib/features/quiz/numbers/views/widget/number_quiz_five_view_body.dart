import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'name_speaker.dart';
import 'number_error_widget.dart';
import 'number_success_widget.dart';
import 'number_text_answer.dart';

class NumberQuizFiveNiewBody extends StatelessWidget {
  const NumberQuizFiveNiewBody({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        children: [
          NameSpeaker(onPressed: () {}),
          const SizedBox(height: 32),
          Text(s.nameOfNumber, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 18),
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColor.babyBlue,
            child: Image.asset(AppAssets.five),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
          Row(
            children: [
              TextAnswerNumber(
                  number: s.nine,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const NumberErrorWidget();
                      },
                    );
                  }),
              TextAnswerNumber(
                  number: s.seven,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return NumberSuccessWidget(
                          onPressed: () {
                            GoRouter.of(context)
                                .push(AppRouter.numberQuizViewSix);
                          },
                        );
                      },
                    );
                  }),
            ],
          ),
          Row(
            children: [
              TextAnswerNumber(
                  number: s.ten,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const NumberErrorWidget();
                      },
                    );
                  }),
              TextAnswerNumber(
                  number: s.five,
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
        ],
      ),
    );
  }
}
