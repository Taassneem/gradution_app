import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context, {
  required Widget content,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: content,
    backgroundColor: AppColor.brown,
  ));
}
