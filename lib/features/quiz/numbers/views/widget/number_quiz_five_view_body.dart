import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
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
      padding: EdgeInsets.all(22.0.r),
      child: Column(
        children: [
          NameSpeaker(onPressed: () {}),
          SizedBox(height: 32.h),
          Text(s.nameOfNumber, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 18.h),
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColor.babyBlue,
            child: Image.asset(AppAssets.five),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08.h),
          Row(
            children: [
              TextAnswerNumber(
                  number: s.nine,
                  onTap: () {
                    customShowDialog(context,
                        widget: const NumberErrorWidget());
                  }),
              TextAnswerNumber(
                  number: s.seven,
                  onTap: () {
                    customShowDialog(context,
                        widget: const NumberErrorWidget());
                  }),
            ],
          ),
          Row(
            children: [
              TextAnswerNumber(
                  number: s.ten,
                  onTap: () {
                    customShowDialog(context,
                        widget: const NumberErrorWidget());
                  }),
              TextAnswerNumber(
                  number: s.five,
                  onTap: () {
                    customShowDialog(context, widget: NumberSuccessWidget(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.numberQuizViewSix);
                      },
                    ));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
