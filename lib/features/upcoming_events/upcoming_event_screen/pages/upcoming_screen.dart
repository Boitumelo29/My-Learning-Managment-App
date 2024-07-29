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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Upcoming Events"),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 3, 29),
              lastDay: DateTime.utc(2030, 3, 16),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            const Text("History card of upcoming events here")
          ],
        ),
      ),
    );
  }
}

class Event {
  final String title;
  final String? subTitle;
  final DateTime dateTime;

  Event({required this.title, this.subTitle, required this.dateTime});
}

class EventModel extends ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events => _events;

  void addEvent(String title, String? subtitle, DateTime dateTime) {
    _events.add(Event(title: title, subTitle: subtitle, dateTime: dateTime));
    notifyListeners();
  }

  List<DateTime> get eventDates {
    return _events.map((event) => event.dateTime).toList();
  }
}
