import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../splash/presentation/views/widget/custom_ok_elevated_button.dart';
import 'days_list_view.dart';

class SelectDayWidget extends StatelessWidget {
  const SelectDayWidget({
    super.key,
    this.isEditTask = false,
  });
  final bool isEditTask;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9.w,
        child: Card(
          color: AppColor.pink,
          child: Padding(
            padding: EdgeInsets.all(18.0.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(S.of(context).selectDays,
                      style: Theme.of(context).textTheme.titleMedium),
                  trailing: Image.asset(AppAssets.calendarClock),
                ),
                DaysListView(isEditTask: isEditTask),
                SizedBox(height: 24.h),
                CustomOkElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: S.of(context).ok)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
