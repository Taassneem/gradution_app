import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWelcomeText extends StatelessWidget {
  const CustomWelcomeText({
    super.key,
    required this.welcome,
    required this.welcomeSubTitle,
  });
  final String welcome;
  final String welcomeSubTitle;
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          welcome,
          style: theme.titleMedium,
        ),
        SizedBox(height: 5.h),
        SizedBox(
          width: 250.w,
          child: Text(
            welcomeSubTitle,
            textAlign: TextAlign.center,
            style: theme.titleSmall,
          ),
        ),
      ],
    );
  }
}
