import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'custom_logout.dart';
import 'profile_view_informations.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
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
              height: MediaQuery.sizeOf(context).height * 0.12,
              width: MediaQuery.sizeOf(context).width,
              color: AppColor.purple,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'Gmail',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: -15,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: AppColor.screenColor,
                    borderRadius: BorderRadius.circular(60),
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(AppAssets.model),
                    )),
              ),
            )
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
        const ProfileViewInformations(),
        const CustomLogOut()
      ],
    );
  }
}
