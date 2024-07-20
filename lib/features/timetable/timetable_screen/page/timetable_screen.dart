import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/util/validation/validation.dart';
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
      appBar: AppBar(
        title: const Text("My Timetable"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogs(context);
        },
        tooltip: "Add Task",
        child: const Icon(Icons.add),
      ),
    );
  }

  showDialogs(BuildContext context) {
    TextEditingController controller = TextEditingController();
    List<Color?> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.lime[600],
    ];

    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("Add A Task"),
              actions: <Widget>[
                TextFormField(
                  controller: controller,
                  validator: (value) => Validation.usernameValidation(value!),
                ),
                const SizedSpace(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const Text("Add"),
                      onTap: () {
                        setState(() {
                          tasks.add(
                            TimePlannerTask(
                              color: colors[Random().nextInt(colors.length)],
                              minutesDuration: 20,
                              dateTime: TimePlannerDateTime(
                                  day: 3, hour: 13, minutes: 12),
                              child: Text(controller.toString()),
                            ),
                          );
                        });
                      },
                    ),
                    GestureDetector(
                      child: const Text("Dismiss"),
                      onTap: () {
                        Navigator.pop(ctx);
                      },
                    )
                  ],
                )
              ],
            ));
  }
}
