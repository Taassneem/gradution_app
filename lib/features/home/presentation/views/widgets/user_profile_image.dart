import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColor.purple,
            image: const DecorationImage(
              image: AssetImage(AppAssets.model),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: 2,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.purple,
            ),
            child: const Icon(Icons.border_color_outlined),
          ),
        )
      ],
    );
  }
}
