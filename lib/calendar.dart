import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime(2022, 7),
        lastDay: DateTime(2023, 1),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _format) {
          setState(() {
            format = _format;
          });
        },
        daysOfWeekVisible: true,
        onDaySelected: (DateTime selectDay, DateTime focusDay) {
          setState(() {
            selectedDay = selectDay;
            focusedDay = focusDay;
          });
        },
      ),
    );
  }
}
