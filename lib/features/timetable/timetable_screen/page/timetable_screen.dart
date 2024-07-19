import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TimePlanner(
          startHour: 6,
          endHour: 23,
          use24HourFormat: false,
          setTimeOnAxis: false,
          headers: [
            TimePlannerTitle(title: "Monday"),
          ],
          tasks: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},tooltip: "Add Task",),
    );
  }
}
