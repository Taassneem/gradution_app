import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
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
        padding: EdgeInsets.all(18.0.r),
        child: Column(
          children: [
            NameSpeaker(onPressed: () {}),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15.h),
            NumberQuestion(question: S.of(context).howManyAnimalsInPicture),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05.h),
            ImageAnswerNumber(
                number: AppAssets.five,
                onTap: () {
                  customShowDialog(context, widget: const NumberErrorWidget());
                }),
            ImageAnswerNumber(
                number: AppAssets.four,
                onTap: () {
                  customShowDialog(context, widget: NumberSuccessWidget(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.numberQuizViewFinal);
                    },
                  ));
                }),
            ImageAnswerNumber(
                number: AppAssets.six2,
                onTap: () {
                  customShowDialog(context, widget: const NumberErrorWidget());
                }),
          ],
        ),
      ),
    );
  }
}
