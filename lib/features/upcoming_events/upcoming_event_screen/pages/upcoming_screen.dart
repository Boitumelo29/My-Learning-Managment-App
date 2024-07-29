import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:provider/provider.dart';
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
            Consumer<EventModel>(
              builder: (context, eventModel, child) {
                return TableCalendar(
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2030, 3, 16),
                  focusedDay: _focusedDay,
                  // calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusDay) {
                    if (eventModel.eventDates
                        .any((eventDate) => isSameDay(eventDate, day))) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        child: Text("${day.day}"),
                      );
                    }
                    return null;
                  }),
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                );
              },
            ),
            Expanded(child: Consumer<EventModel>(
              builder: (context, eventModel, child) {
                return ListView.builder(
                    itemCount: eventModel.events.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(),
                      );
                    });
              },
            ))
          ],
        ),
      ),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String _getMonth(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
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
