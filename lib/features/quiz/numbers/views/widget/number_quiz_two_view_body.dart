import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/back_to_home.dart';
import 'package:gradution_app/generated/l10n.dart';

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
        padding: EdgeInsets.all(22.0.r),
        child: Column(
          children: [
            const BackToHome(),
            SizedBox(height: 32.h),
            NumberQuestion(
              question: S.of(context).meaningOfSeven,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.08.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageAnswerNumber(
                    number: AppAssets.six,
                    isWhite: true,
                    onTap: () {
                      customShowDialog(context,
                          widget: const NumberErrorWidget());
                    }),
                ImageAnswerNumber(
                    number: AppAssets.seven,
                    isWhite: true,
                    onTap: () {
                      customShowDialog(context, widget: NumberSuccessWidget(
                        onPressed: () {
                          GoRouter.of(context)
                              .push(AppRouter.numberQuizViewThree);
                        },
                      ));
                    }),
                ImageAnswerNumber(
                    number: AppAssets.nine,
                    isWhite: true,
                    onTap: () {
                      customShowDialog(context,
                          widget: const NumberErrorWidget());
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
