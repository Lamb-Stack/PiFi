import 'package:flutter/material.dart';
import 'package:pi_fi/event.dart';
import 'package:table_calendar/table_calendar.dart';

import 'chart_view.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

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
        title: const Text("Calendar"),
      ),
      body: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime(2022, 7),
          lastDay: DateTime(2023, 1),
          calendarFormat: format,
          onFormatChanged: (CalendarFormat format) {
            setState(() {
              format = format;
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
          calendarStyle: const CalendarStyle(
            isTodayHighlighted: true,
            selectedDecoration: BoxDecoration(
              color: Colors.teal,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(color: Colors.white),
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyHomePage(
              title: 'Daily Spending',
            );
          }));
        },
        label: const Text("View Chart"),
      ),
    );
  }
}
