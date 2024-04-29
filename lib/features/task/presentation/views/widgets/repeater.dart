import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../splash/presentation/views/widget/custom_ok_elevated_button.dart';
import 'repeater_list_view.dart';

class Repeater extends StatelessWidget {
  const Repeater({super.key});

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
                  title: Text(S.of(context).repeater,
                      style: Theme.of(context).textTheme.titleMedium),
                  trailing: Image.asset(AppAssets.repeater),
                ),
                const RepeaterListView(),
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
