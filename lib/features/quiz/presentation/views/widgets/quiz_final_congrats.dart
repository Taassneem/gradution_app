import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

class QuizFinalCongrats extends StatelessWidget {
  const QuizFinalCongrats({
    super.key,
    required this.image,
    required this.quiz,
  });
  final String image;
  final String quiz;
  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.blur))),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0.h),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(30.w),
              border: const Border(
                  top: BorderSide(color: AppColor.babyBlue, width: 2),
                  left: BorderSide(color: AppColor.babyBlue, width: 2),
                  right: BorderSide(color: AppColor.babyBlue, width: 2),
                  bottom: BorderSide(color: AppColor.babyBlue, width: 2)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(image),
                SizedBox(height: 40.h),
                Text(s.congratulations,
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 10.h),
                Text(
                  quiz,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.babyBlue),
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRouter.quizView);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Text(s.done,
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
