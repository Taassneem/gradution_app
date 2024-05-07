import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: MediaQuery.sizeOf(context).width * 0.8,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
