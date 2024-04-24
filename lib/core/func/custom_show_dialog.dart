import 'package:flutter/material.dart';

Future<dynamic> customShowDialog(BuildContext context,
    {required Widget widget}) {
  return showDialog(
      context: context,
      builder: (context) {
        return widget;
      });
}
