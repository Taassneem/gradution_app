import 'package:flutter/material.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_color.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TableCalendar(
          rowHeight: 35,
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
              todayTextStyle: const TextStyle(
                  color: AppColor.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              defaultTextStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              outsideTextStyle: TextStyle(
                  color:
                      widget.isWeekCalender ? AppColor.weekEnd : AppColor.pink),
              weekendTextStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor.weekEnd),
              todayDecoration: const BoxDecoration(
                color: AppColor.pink,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: const TextStyle(
                  color: AppColor.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              selectedDecoration: const BoxDecoration(
                  color: AppColor.white, shape: BoxShape.circle)),
          onDaySelected: selectedDay,
          selectedDayPredicate: (day) => isSameDay(day, today),
          daysOfWeekHeight: 22,
          focusedDay: today,
          headerVisible: false,
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2058, 12, 31)),
    );
  }
}
