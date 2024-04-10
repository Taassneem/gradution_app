import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          headlineLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w800),
          headlineMedium:
              TextStyle(fontSize: 40, fontWeight: FontWeight.w800)));
}
