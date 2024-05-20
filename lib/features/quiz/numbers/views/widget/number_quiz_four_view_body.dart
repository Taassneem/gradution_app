import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/hexagon_shape.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/back_to_home.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_error_widget.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_success_widget.dart';
import 'package:gradution_app/generated/l10n.dart';

class NumberQuizFourViewBody extends StatelessWidget {
  const NumberQuizFourViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BackToHome(),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.08.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HexagonShape(
                number: '6',
                isOneNumber: true,
                isColored: true,
                onTap: () {
                  customShowDialog(context, widget: const NumberErrorWidget());
                }),
            HexagonShape(
                number: '7',
                isOneNumber: true,
                isColored: true,
                onTap: () {
                  customShowDialog(context, widget: const NumberErrorWidget());
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HexagonShape(
                number: '8',
                isOneNumber: true,
                isColored: true,
                onTap: () {
                  customShowDialog(context, widget: const NumberErrorWidget());
                }),
            HexagonShape(
                number: '5',
                isOneNumber: true,
                isColored: true,
                onTap: () {
                  customShowDialog(context, widget: const NumberErrorWidget());
                }),
            HexagonShape(
              number: '4',
              isOneNumber: true,
              isColored: true,
              onTap: () {
                customShowDialog(context, widget: NumberSuccessWidget(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.numberQuizViewFive);
                  },
                ));
              },
            )
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05.h),
        Text(
          S.of(context).howManyAnimalsInPicture,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05.h),
        Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width.w,
              height: MediaQuery.sizeOf(context).height * 0.35.h,
              decoration: BoxDecoration(
                  color: AppColor.babyBlue,
                  borderRadius: BorderRadius.circular(20.w)),
            ),
            Positioned(
              left: 35.w,
              top: 16.h,
              child: Transform.rotate(
                  angle: -5 * 3.141592653589793 / 180.r,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.75.w,
                    height: MediaQuery.sizeOf(context).height * 0.3.h,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(20.w)),
                  )),
            ),
            Positioned(
                top: 30.h,
                left: 80.w,
                child: Center(child: Image.asset(AppAssets.dabdob)))
          ],
        )
      ],
    );
  }
}
