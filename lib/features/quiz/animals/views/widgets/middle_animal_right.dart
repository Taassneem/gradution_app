import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class MiddleAnimalRight extends StatelessWidget {
  const MiddleAnimalRight({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.animalRight),
              Text(
                S.of(context).success,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                S.of(context).correct,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0.h),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppColor.right),
                onPressed: onPressed,
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Text(
                    S.of(context).continue1,
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

