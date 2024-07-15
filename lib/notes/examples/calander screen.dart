import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  double _hoursWorked = 6;
  String _workDetails = '';
  List<Task> _tasks = [];

  // Function to handle the submission
  void _handleSubmit() {
    setState(() {
      _tasks.add(Task(
        company: 'New Company', // Replace with actual company name
        task: _workDetails,
        hours: _hoursWorked.toInt(),
        status: 'Pending',
      ));
      _hoursWorked = 6;
      _workDetails = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Work details submitted successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('April'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
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
          Expanded(
            child: ListView(
              children: _tasks.map((task) => TaskCard(task: task)).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _hoursWorked,
                    min: 1,
                    max: 12,
                    divisions: 11,
                    label: '$_hoursWorked',
                    onChanged: (double value) {
                      setState(() {
                        _hoursWorked = value;
                      });
                    },
                  ),
                ),
                Text('Hours Worked'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter work details...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _workDetails = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _handleSubmit,
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task task;

  TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(task.company),
        subtitle: Text(task.task),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${task.hours} H'),
            Text(task.status),
          ],
        ),
      ),
    );
  }
}



class Task {
  final String company;
  final String task;
  final int hours;
  final String status;

  Task({
    required this.company,
    required this.task,
    required this.hours,
    required this.status,
  });

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(company),
        subtitle: Text(task),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$hours H'),
            Text(status),
          ],
        ),
      ),
    );
  }
}
