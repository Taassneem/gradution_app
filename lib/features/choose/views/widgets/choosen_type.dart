import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class ChoosenType extends StatelessWidget {
  const ChoosenType({
    super.key,
    this.onTap,
    required this.image,
    required this.type,
  });
  final Function()? onTap;
  final String image;
  final String type;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
                color: AppColor.white,
                border: const Border(
                    bottom: BorderSide(color: AppColor.purple),
                    top: BorderSide(color: AppColor.purple),
                    left: BorderSide(color: AppColor.purple),
                    right: BorderSide(color: AppColor.purple)),
                borderRadius: BorderRadius.circular(100.w)),
            child: Image.asset(image),
          ),
          SizedBox(height: 24.h),
          Text(type, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
