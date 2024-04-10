import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'custom_logout.dart';
import 'profile_view_informations.dart';

class ProvileViewBody extends StatelessWidget {
  const ProvileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.045),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.11,
              width: MediaQuery.sizeOf(context).width,
              color: AppColor.purple,
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(' name'), Text(' gmail')],
                ),
              ),
            ),
            Positioned(
                right: 10,
                top: 15,
                child: Image.asset(
                  AppAssets.model,
                ))
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
        const ProfileViewInformations(),
        const CustomLogOut()
      ],
    );
  }
}
