import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/splash/presentation/views/widget/custom_ok_elevated_button.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/all_days_widget.dart';
import 'widgets/choosen_feature.dart';

class TestTask extends StatelessWidget {
  const TestTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pink,
      body: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(S.of(context).selectDays,
                  style: Theme.of(context).textTheme.titleMedium),
              trailing: Image.asset(AppAssets.calendarClock),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.white, width: 1.5.w),
                  borderRadius: BorderRadius.circular(10.w)),
              child: Column(
                children: [
                  ChoosenFeature(feature: S.of(context).saturday),
                  ChoosenFeature(feature: S.of(context).sunday),
                  ChoosenFeature(feature: S.of(context).monday),
                  ChoosenFeature(feature: S.of(context).tuesday),
                  ChoosenFeature(feature: S.of(context).wednesday),
                  ChoosenFeature(feature: S.of(context).thursday),
                  ChoosenFeature(feature: S.of(context).friday),
                  SizedBox(height: 8.h),
                  const AllDaysWidget()
                ],
              ),
            ),
            SizedBox(height: 24.h),
            CustomOkElevatedButton(onPressed: () {})
          ],
        ),
      ),
    );
  }
}
