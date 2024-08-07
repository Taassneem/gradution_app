import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class CustomProfileFeature extends StatelessWidget {
  const CustomProfileFeature({
    super.key,
    required this.featureName,
    required this.featureType,
    this.leading,
    this.trailing,
  });
  final String featureName;
  final String featureType;
  final Widget? leading;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(featureName, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8.h),
        ListTileAction(
            featureType: featureType, leading: leading, trailing: trailing),
      ],
    );
  }
}

class ListTileAction extends StatelessWidget {
  const ListTileAction({
    super.key,
    required this.featureType,
    required this.leading,
    required this.trailing,
  });

  final String featureType;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10.w),
              border: Border.all(color: AppColor.purple, width: 2.w)),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(featureType,
                style: Theme.of(context).textTheme.titleSmall),
            leading: leading,
            trailing: trailing,
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
