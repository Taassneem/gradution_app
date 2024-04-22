import 'package:flutter/material.dart';
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
              dowTextFormatter: widget.isWeekCalender
                  ? (date, locale) {
                      return DateFormat.E(locale).format(date)[0] +
                          DateFormat.E(locale).format(date)[1].toUpperCase();
                    }
                  : (date, locale) => DateFormat.E(locale).format(date)[0]),
          calendarFormat: widget.isWeekCalender
              ? CalendarFormat.week
              : CalendarFormat.month,
          calendarStyle: const CalendarStyle(
              todayTextStyle: TextStyle(
                  color: AppColor.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              defaultTextStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              outsideTextStyle: TextStyle(color: AppColor.pink),
              weekendTextStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF5A5A5A)),
              todayDecoration: BoxDecoration(
                color: AppColor.pink,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(
                  color: AppColor.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              selectedDecoration:
                  BoxDecoration(color: AppColor.white, shape: BoxShape.circle)),
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
