import 'dart:html';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class calendar extends StatefulWidget {
  @Override
  _CalendarState createState() => _CalendarState();
}

class _calenderState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  const Calendar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime(2022, 7),
          lastDay: DateTime(2023, 1),
          calenderFormat: format,
          onFormatChanged: (CalendarFormat _format) {
            set(() {
              format = _format;
            });
          },
          daysOfWeekVisible: true, onDaySelected: (DateTime selectDay, DateTime focusDay){
            setState(() {
              selectedDay = selectDay;
              focusedDay = focusDay;
            });
          },
        ),
    );
  }
}
