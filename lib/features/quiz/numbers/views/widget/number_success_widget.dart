import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class NumberSuccessWidget extends StatelessWidget {
  const NumberSuccessWidget({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.82.w,
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(10.w)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.right,
                  borderRadius: BorderRadius.circular(10.w)),
              height: 200.h,
              width: MediaQuery.sizeOf(context).width.w,
              child: Image.asset(AppAssets.numberSuccess),
            ),
            Padding(
              padding: EdgeInsets.all(18.0.r),
              child: Column(
                children: [
                  Text(
                    S.of(context).success,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 250.w,
                    child: Text(
                      S.of(context).correct,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.0.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.right,
                        fixedSize: Size.fromWidth(150.w)),
                    onPressed: onPressed,
                    child: Text(
                      S.of(context).continue1,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColor.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
