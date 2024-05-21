import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/views/widgets/custom_divider.dart';

class CustomProfileFeature extends StatelessWidget {
  const CustomProfileFeature({
    super.key,
    required this.featureName,
    required this.featureType,
    this.leading,
    this.trailing,
    this.more = false,
    required this.featureTypeTwo,
    this.leadingTwo,
    this.trailingTwo,
  });
  final String featureName;
  final String featureType;
  final Widget? leading;
  final Widget? trailing;
  final String featureTypeTwo;
  final Widget? leadingTwo;
  final Widget? trailingTwo;
  final bool more;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(featureName, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10.w),
              border: Border.all(color: AppColor.purple, width: 2.w)),
          child: more
              ? Column(
                  children: [
                    ListTile(
                      title: Text(featureType,
                          style: Theme.of(context).textTheme.titleSmall),
                      leading: leading,
                      trailing: trailing,
                    ),
                    SizedBox(
                        width: 250.w,
                        child: const CustomDivider(isTaskView: true)),
                    ListTile(
                      title: Text(featureTypeTwo,
                          style: Theme.of(context).textTheme.titleSmall),
                      leading: leadingTwo,
                      trailing: trailingTwo,
                    ),
                  ],
                )
              : ListTile(
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
