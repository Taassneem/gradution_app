import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            Expanded(
              child: CupertinoDatePicker(
                onDateTimeChanged: (value) {
                  BlocProvider.of<TaskCubit>(context).time = value;
                },
                // backgroundColor: AppColor.pink,
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime.now(),
              ),
            ),
            // Column(
            //   children: [
            //     Text(S.of(context).hour,
            //         style: Theme.of(context).textTheme.titleSmall),
            //     const SizedBox(height: 8),
            //     CustomTimeTextField(controller: hour),
            //   ],
            // ),
            // const Column(
            //   children: [
            //     SizedBox(height: 24),
            //     CircleAvatar(backgroundColor: AppColor.black, radius: 5),
            //     SizedBox(height: 10),
            //     CircleAvatar(backgroundColor: AppColor.black, radius: 5),
            //   ],
            // ),
            // Column(
            //   children: [
            //     Text(S.of(context).min,
            //         style: Theme.of(context).textTheme.titleSmall),
            //     const SizedBox(height: 8),
            //     CustomTimeTextField(controller: minute, isMinute: true),
            //   ],
            // ),
            // Column(
            //   children: [
            //     CustomTimeSelector(
            //       time: S.of(context).am,
            //     ),
            //     const SizedBox(height: 8),
            //     CustomTimeSelector(
            //       time: S.of(context).pm,
            //     ),
            //     const SizedBox(height: 8),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
