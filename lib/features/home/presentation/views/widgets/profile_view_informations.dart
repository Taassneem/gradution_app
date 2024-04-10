import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'drop_dwon_button.dart';
import 'profile_feature.dart';

class ProfileViewInformations extends StatelessWidget {
  const ProfileViewInformations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          CustomProfileFeature(
            featureName: S.of(context).account,
            featureType: S.of(context).editProfile,
            leading: const Icon(Icons.person, color: AppColor.purple),
            trailing: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.keyboard_double_arrow_right_outlined)),
          ),
          CustomProfileFeature(
            featureName: S.of(context).notification,
            featureType: S.of(context).notification,
            leading: const Icon(Icons.notifications, color: AppColor.purple),
            trailing: CupertinoSwitch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          CustomProfileFeature(
            featureName: S.of(context).more,
            featureType: S.of(context).language,
            leading: const Icon(
              Icons.language,
              color: AppColor.blue,
            ),
            trailing: const CustomDropDwonButton(),
          ),
        ],
      ),
    );
  }
}
