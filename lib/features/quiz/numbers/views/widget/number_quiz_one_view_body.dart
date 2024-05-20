import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/back_to_home.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_error_widget.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_success_widget.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'number_answer_image.dart';
import 'number_question_circular.dart';

class NumberQuizOneViewBody extends StatelessWidget {
  const NumberQuizOneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(28.0.r),
      child: Column(
        children: [
          const BackToHome(isWhite: true),
          SizedBox(height: 32.h),
          NumberQuestionCircular(
            question: S.of(context).sum,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08.h),
          ImageAnswerNumber(
              number: AppAssets.twelve,
              isWhite: true,
              onTap: () {
                customShowDialog(context, widget: const NumberErrorWidget());
              }),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01.h),
          ImageAnswerNumber(
              number: AppAssets.eleven,
              isWhite: true,
              onTap: () {
                customShowDialog(context, widget: NumberSuccessWidget(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.numberQuizViewTwo);
                  },
                ));
              }),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01.h),
          ImageAnswerNumber(
              number: AppAssets.ten,
              isWhite: true,
              onTap: () {
                customShowDialog(context, widget: const NumberErrorWidget());
              })
        ],
      ),
    );
  }
}
