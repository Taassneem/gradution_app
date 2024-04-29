import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

ThemeData getThemeData() {
  return ThemeData(
      scaffoldBackgroundColor: AppColor.screenColor,
      appBarTheme:
          const AppBarTheme(surfaceTintColor: Colors.transparent, elevation: 0),
      textTheme: const TextTheme(
        displaySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        headlineLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w800),
        headlineMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
      ));
}
