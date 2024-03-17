import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          headlineLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w800),
          headlineMedium:
              TextStyle(fontSize: 40, fontWeight: FontWeight.w800)));
}
