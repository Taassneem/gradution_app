import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class QuizItemField extends StatelessWidget {
  const QuizItemField({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.left,
    this.paddingLeft = 0,
  });
  final String image;
  final String title;
  final Function()? onTap;
  final double? left;
  final double paddingLeft;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: 16.h,
          left: isArabic() ? 0 : paddingLeft.w,
          right: isArabic() ? paddingLeft.w : 0),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 180.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(16.r),
                height: 170.h,
                width: 170.w,
                decoration: BoxDecoration(
                    border: const Border(
                        top: BorderSide(color: AppColor.babyBlue, width: 2),
                        left: BorderSide(color: AppColor.babyBlue, width: 2),
                        right: BorderSide(color: AppColor.babyBlue, width: 2),
                        bottom: BorderSide(color: AppColor.babyBlue, width: 2)),
                    borderRadius: BorderRadius.circular(20.w)),
                child: Image.asset(image),
              ),
              Positioned(
                bottom: -3,
                left: left!.w,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                        color: AppColor.babyBlue,
                        borderRadius: BorderRadius.circular(20.w)),
                    child: Text(title,
                        style: Theme.of(context).textTheme.titleSmall)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
