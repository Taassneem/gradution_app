import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../splash/presentation/views/widget/custom_ok_elevated_button.dart';
import 'choosen_feature.dart';

class Reminder extends StatelessWidget {
  const Reminder({super.key});

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
                  title: Text(S.of(context).reminder,
                      style: Theme.of(context).textTheme.titleMedium),
                  trailing: Image.asset(AppAssets.reminder),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.white, width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ChoosenFeature(feature: S.of(context).onTime),
                      ChoosenFeature(feature: S.of(context).fiveMinutesBefore),
                      ChoosenFeature(
                          feature: S.of(context).fifteenMinutesBefore),
                      ChoosenFeature(
                          feature: S.of(context).thirtyMinutesBefore,
                          isFinalFeature: true)
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
