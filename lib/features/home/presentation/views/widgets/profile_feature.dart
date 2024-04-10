import 'package:flutter/material.dart';
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
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.purple, width: 2)),
          child: ListTile(
            title: Text(featureType,
                style: Theme.of(context).textTheme.titleSmall),
            leading: leading,
            trailing: trailing,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
