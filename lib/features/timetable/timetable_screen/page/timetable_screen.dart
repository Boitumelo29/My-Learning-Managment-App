import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  List<TimePlannerTask> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TimePlanner(
          startHour: 6,
          endHour: 23,
          use24HourFormat: false,
          setTimeOnAxis: false,
          headers: const [
            TimePlannerTitle(title: "Monday"),
            TimePlannerTitle(title: "Tuesday"),
            TimePlannerTitle(title: "Wednesday"),
            TimePlannerTitle(title: "Thursday"),
            TimePlannerTitle(title: "Friday"),
            TimePlannerTitle(title: "Saturday"),
            TimePlannerTitle(title: "Sunday"),
          ],
          tasks: tasks,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add Task",
        child: const Icon(Icons.add),
      ),
    );
  }
}
