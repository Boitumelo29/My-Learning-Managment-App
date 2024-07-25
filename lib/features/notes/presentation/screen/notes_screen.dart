import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
      shouldScroll: true,
      title: "My Notes",
      shouldHaveFloatingButton: true,
      shouldBeCentered: true,
      icon: Icons.add,
      floatingActionButton: () => _showInputAlert(context),
      children: [],
    );
  }

  _showInputAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Enter Notes"),
            content: SizedBox(
              height: 200,
              width: 300,
              child: Column(
                children: [
                  LongTextFieldForm(
                      controller: controller,
                      onChanged: (value) {},
                      hintText: "Add task",
                      labelText: "Add Task",
                      showSuffixIcon: false,
                      showPrefixIcon: true,
                      prefixIcon: Icons.task,
                      validator: (value) {},
                      obsureText: false,
                      isRed: true),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            if (controller.text.isNotEmpty) {
                              ///Todo come back an finish
                              // Provider.of(context, listen: false).addNotes(Note(title: controller.text));
                              controller.clear();
                            }
                          },
                          child: const Text("Add"))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

class Note {
  String title;
  String? description;
  IconData? iconData;

  Note({required this.title, this.description, this.iconData});
}


// class