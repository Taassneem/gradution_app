import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

ThemeData getThemeData() {
  return ThemeData(
      scaffoldBackgroundColor: AppColor.screenColor,
      appBarTheme:
          const AppBarTheme(surfaceTintColor: Colors.transparent, elevation: 0),
      textTheme: TextTheme(
        displaySmall: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
        titleLarge: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800),
        titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        headlineLarge: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w800),
        headlineMedium: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w800),
      ));
}
