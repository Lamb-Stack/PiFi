import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pi_fi/event.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

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
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            eventLoader: _getEventsfromDay,
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
            )));
    floatingActionButton:
    FloatingActionButton.extended(
      /*SAM HERE*/ onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Add Event"),
                content: Text("Enter Event Title"),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: Text("Cancel"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )),
      label: Text("Add Event"),
      icon: Icon(Icons.add),
    );
  }
}
