import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/features/timetable/timetable_screen/page/timetable_screen.dart';
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
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textEditingControllerSub =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Upcoming Events"),
      ),
      body:
          //SingleChildScrollView(
          //  physics: const ScrollPhysics(),
          // child:
          Column(
        children: [
          Consumer<EventModel>(
            builder: (context, eventModel, child) {
              return TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
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
                calendarBuilders:
                    CalendarBuilders(defaultBuilder: (context, day, focusDay) {
                  if (eventModel.eventDates
                      .any((eventDate) => isSameDay(eventDate, day))) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
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
          Expanded(
            child: Consumer<EventModel>(
              builder: (context, eventModel, child) {
                return ListView.builder(
                    itemCount: eventModel.events.length,
                    itemBuilder: (context, index) {
                      final event = eventModel.events[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          onTap: () => showDetail(context),
                          leading: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            child: Text(
                                "${event.dateTime.day} ${_getMonth(event.dateTime.month)}"),
                          ),
                          title: Text(event.title),
                          subtitle: Text(event.subTitle ?? ""),
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
      //),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addEventAlert(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _addEventAlert(BuildContext context) async {
    DateTime? selectedDate;
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: const Text("Add event"),
              content: SizedBox(
                height: 200,
                width: 500,
                child: Column(
                  children: <Widget>[
                    LongTextFieldForm(
                        controller: textEditingController,
                        onChanged: (value) {},
                        hintText: "Enter Task",
                        labelText: "Enter Task",
                        showSuffixIcon: false,
                        showPrefixIcon: true,
                        prefixIcon: Icons.date_range,
                        validator: (value) {},
                        obsureText: false,
                        isRed: true),
                    LongTextFieldForm(
                        controller: textEditingControllerSub,
                        onChanged: (value) {},
                        hintText: "Enter Task",
                        labelText: "Enter Task",
                        showSuffixIcon: false,
                        showPrefixIcon: true,
                        prefixIcon: Icons.date_range,
                        validator: (value) {},
                        obsureText: false,
                        isRed: true),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconsContainer(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2101));
                            if (picked != null) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          title: 'Date',
                          icon: Icons.date_range,
                        ),
                        // if (selectedDate != null)
                        //   Text("Selected date: ${selectedDate!.toLocal()}")
                        // else
                        //   const Text("")
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (textEditingController.text.isNotEmpty &&
                              selectedDate != null) {
                            Provider.of<EventModel>(context, listen: false)
                                .addEvent(
                                    textEditingController.text,
                                    textEditingControllerSub.text,
                                    selectedDate!);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Add"))
                  ],
                )
              ],
            );
          });
        });
  }

  showDetail(context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Event Details'),
          content: SizedBox(
            height: 300,
            width: 500,
            child: Column(
              children: [
                Text(textEditingController.text),
                Text(textEditingControllerSub.text)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
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
  final List<Event> _events = [];

  List<Event> get events => _events;

  void addEvent(String title, String? subtitle, DateTime dateTime) {
    _events.add(Event(title: title, subTitle: subtitle, dateTime: dateTime));
    notifyListeners();
  }

  List<DateTime> get eventDates {
    return _events.map((event) => event.dateTime).toList();
  }
}
