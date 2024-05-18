import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/widgets/custom_text_shimmer.dart';

class CustomTextFieldShimmer extends StatelessWidget {
  const CustomTextFieldShimmer({
    super.key,
    required this.textFieldName,
  });

  final String textFieldName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 10.h),
        Container(
            alignment:
                isArabic() ? Alignment.centerRight : Alignment.centerLeft,
            width: MediaQuery.sizeOf(context).width.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(11.r),
              child: const CustomTextShimmer(),
            )),
      ],
    );
  }
}
