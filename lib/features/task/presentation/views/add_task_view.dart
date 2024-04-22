import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/views/widgets/custom_calender.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'package:numberpicker/numberpicker.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pink,
      appBar: AppBar(
        title: Text(
          S.of(context).createNewTask,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: AppColor.pink,
      ),
      body: Column(
        children: [
          const CustomCalender(
            isWeekCalender: true,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(50)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  S.of(context).taskTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    fillColor: AppColor.pink,
                    filled: true,
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).time,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [CustomNumberPicker(),
                  Column(children: [
                    
                  ],)],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class CustomNumberPicker extends StatefulWidget {
  const CustomNumberPicker({
    super.key,
  });

  @override
  State<CustomNumberPicker> createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {
  var hour = 0;
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: 0,
      maxValue: 12,
      value: hour,
      onChanged: (value) {
        setState(() {
          hour = value;
        });
      },
    );
  }
}
