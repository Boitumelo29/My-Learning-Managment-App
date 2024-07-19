import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
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
    return AppBarScreen(
      title: 'My Time Table',
      shouldScroll: true,
      shouldHaveFloatingButton: true,
      floatingActionButton: () {
        _addObjects(context);
      },
      tooltip: "add",
      icon: Icons.add,
      children: [
        TimePlanner(
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
        )
      ],
    );
  }

  void _addObjects(BuildContext context) {
    List<Color?> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.lime[600],
    ];

    setState(() {
      tasks.add(
        TimePlannerTask(
          color: colors[Random().nextInt(colors.length)],
          minutesDuration: 20,
          dateTime: TimePlannerDateTime(day: 1, hour: 11, minutes: 8),
        ),
      );
    });
  }
}
