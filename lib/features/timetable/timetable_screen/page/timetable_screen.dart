import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
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
  DateTime _dateTime = DateTime.now();

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
        onPressed: () => showBottomSheetModal(context),
        tooltip: "Add Task",
        child: const Icon(Icons.add),
      ),
    );
  }

  ///Todo: changing it from  a dialog to a bottom sheet modal
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
                                  day: 0, hour: 9, minutes: 12),
                              child: Text(controller.text),
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

  ///Todo: the bottom sheet modal
  showBottomSheetModal(BuildContext context) {
    String dayOfTheWeek = "Monday";
    List<String> daysOfTheWeek = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    TextEditingController controller = TextEditingController();
    List<Color?> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.lime[600],
    ];

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 600,
              child: Column(children: <Widget>[
                const Text("Add a Task to your Timetable"),
                TextFormField(
                  controller: controller,
                  validator: (value) => Validation.usernameValidation(value!),
                ),
                DropdownButton(
                    value: dayOfTheWeek,
                    onChanged: (value) {
                      ///todo: fix the state
                      print(value);
                      setState(() {
                        dayOfTheWeek = value!;
                      });
                    },
                    items: daysOfTheWeek.map((String daysOfTheWeek) {
                      return DropdownMenuItem(
                        value: daysOfTheWeek,
                        child: Text(daysOfTheWeek),
                      );
                    }).toList()),
                hourMin(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                      "${_dateTime.hour.toString().padLeft(2, "0")} : ${_dateTime.minute.toString().padLeft(2, '0')}"),
                ),
                // const SizedSpace(
                //   height: 30,
                // ),
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
                              minutesDuration: 60,
                              dateTime: TimePlannerDateTime(
                                  day: 0,
                                  hour: _dateTime.hour,
                                  minutes: _dateTime.minute),
                              child: Text(controller.text),
                            ),
                          );
                        });
                      },
                    ),
                    GestureDetector(
                      child: const Text("Dismiss"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ]),
            ),
          );
        });
  }

  Widget hourMin() {
    return TimePickerSpinner(
      spacing: 40,
      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
