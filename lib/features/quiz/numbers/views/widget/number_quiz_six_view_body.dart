import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/back_to_home.dart';
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
      padding: EdgeInsets.all(18.0.r),
      child: Column(
        children: [
          const BackToHome(),
          SizedBox(height: 32.h),
          TextAnswerNumber(number: S.of(context).six, question: true),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08.h),
          ImageAnswerNumber(
              number: AppAssets.three,
              onTap: () {
                customShowDialog(context, widget: const NumberErrorWidget());
              }),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01.h),
          ImageAnswerNumber(
              number: AppAssets.six2,
              onTap: () {
                customShowDialog(context, widget: NumberSuccessWidget(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.numberQuizViewSeven);
                  },
                ));
              }),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01.h),
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
