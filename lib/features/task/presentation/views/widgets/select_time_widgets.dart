import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class SelectTimeWidgets extends StatelessWidget {
  const SelectTimeWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    tz.initializeTimeZones();
    final egyptTimezone = tz.getLocation('Africa/Cairo');
    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: SizedBox(
        height: 80.h,
        child: Row(
          children: [
            Expanded(
              child: CupertinoDatePicker(
                onDateTimeChanged: (value) {
                  final egyptTime = tz.TZDateTime.from(value, egyptTimezone);
                  BlocProvider.of<TaskCubit>(context).setTime(egyptTime);
                  log("Selected Time: $value");
                  log("Egypt Time: $egyptTime");
                },
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime.now(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
