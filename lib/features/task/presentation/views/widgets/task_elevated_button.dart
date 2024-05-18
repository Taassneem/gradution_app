import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class TaskElevatedButton extends StatelessWidget {
  const TaskElevatedButton({
    super.key,
    this.onPressed,
    this.isWhite = true,
    this.upload = false,
  });
  final void Function()? onPressed;
  final bool isWhite;
  final bool upload;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(200.w, 50.h),
            backgroundColor: isWhite ? AppColor.white : AppColor.pink,
            elevation: 0),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              upload ? Icons.file_upload_outlined : Icons.add,
              color: AppColor.black,
            ),
            SizedBox(width: 8.w),
            Text(upload ? S.of(context).uploadPhoto : S.of(context).addTask,
                style: Theme.of(context).textTheme.titleSmall),
          ],
        ));
  }
}
