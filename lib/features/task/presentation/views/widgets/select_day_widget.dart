import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../splash/presentation/views/widget/custom_ok_elevated_button.dart';
import 'all_days_widget.dart';
import 'choosen_feature.dart';

class SelectDayWidget extends StatelessWidget {
  const SelectDayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Card(
          color: AppColor.pink,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(S.of(context).selectDays,
                      style: Theme.of(context).textTheme.titleMedium),
                  trailing: Image.asset(AppAssets.calendarClock),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.white, width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ChoosenFeature(feature: S.of(context).saturday),
                      ChoosenFeature(feature: S.of(context).sunday),
                      ChoosenFeature(feature: S.of(context).monday),
                      ChoosenFeature(feature: S.of(context).tuesday),
                      ChoosenFeature(feature: S.of(context).wednesday),
                      ChoosenFeature(feature: S.of(context).thursday),
                      ChoosenFeature(feature: S.of(context).friday),
                      const SizedBox(height: 8),
                      const AllDaysWidget()
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                CustomOkElevatedButton(onPressed: () {
                  Navigator.pop(context);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
