import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class NumberErrorWidget extends StatelessWidget {
  const NumberErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.82.w,
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.error,
                  borderRadius: BorderRadius.circular(10.w)),
              height: 200.h,
              width: MediaQuery.sizeOf(context).width.w,
              child: Image.asset(AppAssets.numberError),
            ),
            Padding(
              padding: EdgeInsets.all(18.0.r),
              child: Column(
                children: [
                  Text(
                    S.of(context).oops,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 250.w,
                    child: Text(
                      S.of(context).errorMessage,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.0.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.error,
                        fixedSize: Size.fromWidth(150.w)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      S.of(context).back,
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
