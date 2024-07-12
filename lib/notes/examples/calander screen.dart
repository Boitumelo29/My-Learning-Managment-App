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

  // Function to handle the submission
  void _handleSubmit() {
    // For demonstration, let's print the details to the console
    print('Selected Day: $_selectedDay');
    print('Hours Worked: $_hoursWorked');
    print('Work Details: $_workDetails');

    // Here you can add the logic to save the data or send it to a server
    // For example, you might want to reset the form after submission
    setState(() {
      _hoursWorked = 6;
      _workDetails = '';
    });

    // You could also show a Snackbar or Dialog to confirm the submission
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
              children: [
                TaskCard(
                  company: 'EnnisFlint Inc.',
                  task: 'Custom App Development',
                  hours: 2,
                  status: 'Billable',
                ),
                TaskCard(
                  company: 'First Data',
                  task: 'Enterprise App Re-design',
                  hours: 2,
                  status: 'No Charge',
                ),
                TaskCard(
                  company: 'American Express',
                  task: 'Mobile Enhancements',
                  hours: 6,
                  status: 'Pending',
                ),
              ],
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
  final String company;
  final String task;
  final int hours;
  final String status;

  TaskCard({
    required this.company,
    required this.task,
    required this.hours,
    required this.status,
  });

  @override
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
