import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';

class SelectTimeWidgets extends StatelessWidget {
  SelectTimeWidgets({
    super.key,
  });

  final TextEditingController hour = TextEditingController();
  final TextEditingController minute = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: SizedBox(
        height: 80.h,
        child: Row(
          children: [
            Expanded(
              child: CupertinoDatePicker(
                onDateTimeChanged: (value) {
                  BlocProvider.of<TaskCubit>(context).time = value;
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
