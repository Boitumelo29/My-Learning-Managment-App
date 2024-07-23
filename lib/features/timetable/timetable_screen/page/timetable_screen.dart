import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
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
        backgroundColor: Colors.red,
        onPressed: () => showBottomSheetModal(context),
        tooltip: "Add Task",
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  ///Todo: changing it from  a dialog to a bottom sheet modal
  // showDialogs(BuildContext context) {
  //   TextEditingController controller = TextEditingController();
  //   List<Color?> colors = [
  //     Colors.purple,
  //     Colors.blue,
  //     Colors.green,
  //     Colors.orange,
  //     Colors.lime[600],
  //   ];
  //
  //   return showDialog(
  //       context: context,
  //       builder: (ctx) => AlertDialog(
  //             title: const Text("Add A Task"),
  //             actions: <Widget>[
  //               TextFormField(
  //                 controller: controller,
  //                 validator: (value) => Validation.usernameValidation(value!),
  //               ),
  //               const SizedSpace(
  //                 height: 30,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   GestureDetector(
  //                     child: const Text("Add"),
  //                     onTap: () {
  //                       setState(() {
  //                         tasks.add(
  //                           TimePlannerTask(
  //                             color: colors[Random().nextInt(colors.length)],
  //                             minutesDuration: 20,
  //                             dateTime: TimePlannerDateTime(
  //                                 day: 0, hour: 9, minutes: 12),
  //                             child: Text(controller.text),
  //                           ),
  //                         );
  //                       });
  //                     },
  //                   ),
  //                   GestureDetector(
  //                     child: const Text("Dismiss"),
  //                     onTap: () {
  //                       Navigator.pop(ctx);
  //                     },
  //                   )
  //                 ],
  //               )
  //             ],
  //           ));
  // }

  ///Todo: the bottom sheet modal
  showBottomSheetModal(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
    final Map<String, int> dayMapping = {
      "Monday": 0,
      "Tuesday": 1,
      "Wednesday": 2,
      "Thursday": 3,
      "Friday": 4,
      "Saturday": 5,
      "Sunday": 6,
    };

    String mainColour = "Purple";
    List<String> dropColor = ["Purple", "Blue", "Green", "Orange", "Lime"];

    List<Color?> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.lime[600],
    ];

    Map<String, Color> colorMap = {
      "Purple": Colors.purple,
      "Blue": Colors.blue,
      "Green": Colors.green,
      "Orange": Colors.orange,
      "Lime": Colors.lime,
    };

    String firstTime = "15 min";
    var howLong = [
      "15 min",
      "30 min",
      "45 min",
      "1 hour",
      "1 hour:30min",
      "2 hours"
    ];

    Map<String, int> timeMap = {
      "15 min": 15,
      "30 min": 30,
      "45 min": 45,
      "1 hour": 60,
      "1 hour:30min": 90,
      "2 hours": 120
    };

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
            child: SizedBox(
              height: 600,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Center(
                      child: Icon(
                        Icons.drag_handle,
                        color: Colors.red,
                      ),
                    ),
                    const SizedSpace(),
                    const Center(
                        child: Text(
                      "Add a Task to your Timetable",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )),
                    const SizedSpace(),

                    ///Todo: maybe we will add the title it looks too much like that one
                    // const Text(
                    //   "Title",
                    //   style: TextStyle(fontSize: 15),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: LongTextFieldForm(
                        onChanged: (value) {},
                        hintText: 'Enter Task',
                        labelText: 'Enter task',
                        showSuffixIcon: false,
                        showPrefixIcon: true,
                        prefixIcon: Icons.pending_actions,
                        validator: (value) {
                          Validation.usernameValidation(value);
                        },
                        obsureText: false,
                      ),
                    ),
                    const SizedSpace(),
                    const Text("Choose a date & Time",
                        style: TextStyle(fontSize: 15)),
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: dayOfTheWeek,
                          icon: const Icon(Icons.date_range),
                          onChanged: (String? newValue) {
                            ///Todo: fix the state
                            print('New value: $newValue');
                            setState(() {
                              dayOfTheWeek = newValue!;
                              print('Updated state: $dayOfTheWeek');
                            });
                          },
                          items: daysOfTheWeek
                              .map<DropdownMenuItem<String>>((String day) {
                            return DropdownMenuItem<String>(
                              value: day,
                              child: Text(day),
                            );
                          }).toList(),
                        ),

                        ///Todo: use gesture detector instead and then use container, you can make this reusable
                        ElevatedButton(
                            onPressed: () {
                              showTimePicker(context);
                            },
                            child: const Text("Select a time")),
                      ],
                    ),
                    Text("Task Type & Duration"),
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: mainColour,
                          icon: const Icon(Icons.color_lens),
                          onChanged: (String? newValue) {
                            ///Todo: fix the state
                            setState(() {
                              dayOfTheWeek = newValue!;
                            });
                          },
                          items: dropColor
                              .map<DropdownMenuItem<String>>((String colors) {
                            return DropdownMenuItem<String>(
                              value: colors,
                              child: Text(colors),
                            );

                            ///"We can add a row of the color in a circle and the text next to it"
                          }).toList(),
                        ),
                        DropdownButton(
                          value: firstTime,
                          icon: const Icon(Icons.watch),
                          onChanged: (String? newValue) {
                            ///Todo: fix the state
                            setState(() {
                              dayOfTheWeek = newValue!;
                            });
                          },
                          items: howLong
                              .map<DropdownMenuItem<String>>((String time) {
                            return DropdownMenuItem<String>(
                              value: time,
                              child: Text(time),
                            );

                            ///"We can add a row of the color in a circle and the text next to it"
                          }).toList(),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 50),
                      child: Text(
                          "${_dateTime.hour.toString().padLeft(2, "0")} : ${_dateTime.minute.toString().padLeft(2, '0')}"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: const Text("Add"),
                          onPressed: () {
                            setState(() {
                              tasks.add(
                                TimePlannerTask(
                                  color: colorMap[mainColour]!,
                                  minutesDuration: timeMap[firstTime]!,
                                  dateTime: TimePlannerDateTime(
                                      day: dayMapping[dayOfTheWeek] ?? 2,
                                      //day: 0,
                                      hour: _dateTime.hour,
                                      minutes: _dateTime.minute),
                                  child: Text(controller.text),
                                ),
                              );
                            });
                          },
                        ),
                        TextButton(
                          child: const Text("Dismiss"),
                          onPressed: () {
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

  showTimePicker(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("select a time"),
            content: TimePickerSpinner(
              is24HourMode: true,
              normalTextStyle:
                  const TextStyle(fontSize: 24, color: Colors.black),
              highlightedTextStyle:
                  const TextStyle(fontSize: 26, color: Colors.red),
              spacing: 50,
              itemHeight: 50,
              isForce2Digits: true,
              onTimeChange: (time) {
                setState(() {
                  _dateTime = time;
                });
              },
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Done"))
            ],
          );
        });
  }
}
