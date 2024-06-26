import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({
    super.key,
    this.isWeekCalender = false,
  });
  final bool isWeekCalender;
  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  DateTime today = DateTime.now();

  void selectedDay(selectedDay, focusedDay) {
    setState(() {
      today = selectedDay;
    });
    BlocProvider.of<TaskCubit>(context).date = today;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0.r),
      child: TableCalendar(
          rowHeight: 35.h,
          daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: Theme.of(context).textTheme.titleSmall!,
              weekendStyle: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColor.weekEnd),
              dowTextFormatter: isArabic()
                  ? (date, locale) => DateFormat.E(locale).format(date)
                  : widget.isWeekCalender
                      ? (date, locale) {
                          return DateFormat.E(locale).format(date)[0] +
                              DateFormat.E(locale)
                                  .format(date)[1]
                                  .toUpperCase();
                        }
                      : (date, locale) => DateFormat.E(locale).format(date)[0]),
          calendarFormat: widget.isWeekCalender
              ? CalendarFormat.week
              : CalendarFormat.month,
          calendarStyle: CalendarStyle(
              todayTextStyle: TextStyle(
                  color: AppColor.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
              defaultTextStyle:
                  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              outsideTextStyle: TextStyle(
                  color:
                      widget.isWeekCalender ? AppColor.weekEnd : AppColor.pink),
              weekendTextStyle: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.weekEnd),
              todayDecoration: const BoxDecoration(
                color: AppColor.pink,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(
                  color: AppColor.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
              selectedDecoration: const BoxDecoration(
                  color: AppColor.white, shape: BoxShape.circle)),
          onDaySelected: selectedDay,
          selectedDayPredicate: (day) {
            BlocProvider.of<TaskCubit>(context).date = today;
            return isSameDay(day, today);
          },
          daysOfWeekHeight: 22.h,
          focusedDay: today,
          headerVisible: false,
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2058, 12, 31)),
    );
  }
}
