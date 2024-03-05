import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
      textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
  ));
}
