import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
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
      padding: EdgeInsets.all(18.0.r),
      child: Column(
        children: [
          NameSpeaker(onPressed: () {}),
          SizedBox(height: 32.h),
          TextAnswerNumber(number: S.of(context).four, question: true),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08.h),
          Row(
            children: [
              TextAnswerNumber(
                  answerImage: true,
                  image: AppAssets.no,
                  onTap: () {
                    customShowDialog(context,
                        widget: const NumberErrorWidget());
                  }),
              TextAnswerNumber(
                  answerImage: true,
                  image: AppAssets.ou,
                  onTap: () {
                    customShowDialog(context, widget: NumberSuccessWidget(
                      onPressed: () {
                        GoRouter.of(context)
                            .push(AppRouter.numberQuizViewEight);
                      },
                    ));
                  }),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.04.h),
          Row(
            children: [
              TextAnswerNumber(
                  answerImage: true,
                  image: AppAssets.uv,
                  onTap: () {
                    customShowDialog(context,
                        widget: const NumberErrorWidget());
                  }),
              TextAnswerNumber(
                  answerImage: true,
                  image: AppAssets.uo,
                  onTap: () {
                    customShowDialog(context,
                        widget: const NumberErrorWidget());
                  }),
            ],
          )
        ],
      ),
    );
  }
}
