import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class MiddleThingsRight extends StatelessWidget {
  const MiddleThingsRight({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: AppColor.white,
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.thingsSuccess, height: 170.h),
              SizedBox(height: 20.0.h),
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
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Text(
                    S.of(context).next,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColor.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
