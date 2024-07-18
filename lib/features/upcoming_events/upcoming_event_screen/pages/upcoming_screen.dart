import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class UpcomingEvents extends StatefulWidget {
  const UpcomingEvents({super.key});

  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  double _hoursWorked = 6;
  String _workDetails = "";

// List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
        shouldScroll: true,
        title: "Upcoming Events",
        children: [
          TableCalendar(
            focusedDay: DateTime.utc(2010, 3, 29),
            firstDay: _focusedDay,
            lastDay: DateTime.utc(2030, 3, 16),
          )
        ]);
  }
}
