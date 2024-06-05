import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimetableScreen(),
    );
  }
}

class TimetableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Timetable'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(color: Colors.grey),
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(100.0),
            1: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Time',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Monday',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Tuesday',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Wednesday',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Thursday',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Friday',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _buildTimetableRow('08:00 - 09:00', 'Math', 'Science', 'History', 'Geography', 'PE'),
            _buildTimetableRow('09:00 - 10:00', 'English', 'Math', 'Science', 'History', 'Art'),
            _buildTimetableRow('10:00 - 11:00', 'Science', 'English', 'Math', 'Science', 'Music'),
            _buildTimetableRow('11:00 - 12:00', 'History', 'Geography', 'PE', 'Art', 'Math'),
            _buildTimetableRow('12:00 - 13:00', 'Lunch', 'Lunch', 'Lunch', 'Lunch', 'Lunch'),
            _buildTimetableRow('13:00 - 14:00', 'PE', 'Art', 'Math', 'Music', 'Science'),
            _buildTimetableRow('14:00 - 15:00', 'Geography', 'PE', 'Art', 'Math', 'Science'),
          ],
        ),
      ),
    );
  }

  TableRow _buildTimetableRow(String time, String monday, String tuesday, String wednesday, String thursday, String friday) {
    return TableRow(
      children: [
        _buildTimetableCell(time),
        _buildTimetableCell(monday),
        _buildTimetableCell(tuesday),
        _buildTimetableCell(wednesday),
        _buildTimetableCell(thursday),
        _buildTimetableCell(friday),
      ],
    );
  }

  Widget _buildTimetableCell(String text) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
