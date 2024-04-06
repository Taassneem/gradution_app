import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class IconMethod extends StatelessWidget {
  const IconMethod({
    super.key,
    this.icon,
    this.onTap,
  });
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width * 0.395,
        decoration: const BoxDecoration(
            color: AppColor.purple,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
        child: Icon(icon),
      ),
    );
  }
}
