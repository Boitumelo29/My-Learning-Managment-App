import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimePickerScreen(),
    );
  }
}

class TimePickerScreen extends StatefulWidget {
  @override
  _TimePickerScreenState createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Picker Spinner Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _showTimePicker(context);
              },
              child: Text('Show Time Picker'),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Time: ${_selectedTime.hour}:${_selectedTime.minute}',
              style:const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  void _showTimePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Time'),
          content: TimePickerSpinner(
            is24HourMode: false,
            normalTextStyle: TextStyle(fontSize: 24, color: Colors.black),
            highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.blue),
            spacing: 50,
            itemHeight: 80,
            isForce2Digits: true,
            onTimeChange: (time) {
              setState(() {
                _selectedTime = time;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
