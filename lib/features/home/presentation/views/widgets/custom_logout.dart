import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class CustomLogOut extends StatelessWidget {
  const CustomLogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133.w,
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(color: AppColor.error)),
      child: ListTile(
        title: Text(S.of(context).logout,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColor.error)),
        leading: const Icon(Icons.logout_outlined, color: AppColor.error),
      ),
    );
  }
}
