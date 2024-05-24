import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/widgets/custom_text_field_shimmer.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class EditProfileShimmer extends StatelessWidget {
  const EditProfileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.w),
          ),
          child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.circular(10.w)),
              )),
        ),
        CustomTextFieldShimmer(textFieldName: S.of(context).fullName),
        SizedBox(height: 24.h),
        CustomTextFieldShimmer(textFieldName: S.of(context).email)
      ],
    );
  }
}
