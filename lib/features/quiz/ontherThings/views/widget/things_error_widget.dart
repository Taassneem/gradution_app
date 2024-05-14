import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class MiddleThingsError extends StatelessWidget {
  const MiddleThingsError({super.key});

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
              Image.asset(
                AppAssets.thingsError,
                height: 150.h,
              ),
              SizedBox(height: 20.0.h),
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
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Text(
                    S.of(context).back,
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
