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
    // return AppBarScreen(
    //   shouldScroll: true,
    //   title: "My Notes",
    //   shouldHaveFloatingButton: true,
    //   shouldBeCentered: false,
    //   icon: Icons.add,
    //   floatingActionButton: () => _showInputAlert(context),
    //   children: [
    //     Expanded(
    //       child: Consumer<NoteProvider>(
    //         builder: (context, noteProvider, child) {
    //           return ListView.builder(
    //             itemCount: noteProvider.notes.length,
    //             itemBuilder: (context, index) {
    //               return NotesCard(note: noteProvider.notes[index]);
    //             },
    //           );
    //         },
    //       ),
    //     )
    //   ],
    // );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Notes"),
      ),
      body: Consumer<NoteProvider>(
        builder: (context, noteProvider, child) {
          return ListView.builder(
            itemCount: noteProvider.notes.length,
            itemBuilder: (context, index) {
              return NotesCard(note: noteProvider.notes[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showInputAlert(context),
        tooltip: "press",
        child: const Icon(Icons.add),
      ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Dismiss")),
                    TextButton(
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          Provider.of<NoteProvider>(context, listen: false)
                              .addNotes(Note(title: controller.text));
                          controller.clear();
                          var snackBar = const SnackBar(
                            content: Text("Note Added"),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          controller.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Note {
  String title;
  String? description;
  IconData? iconData;

  Note({required this.title, this.description, this.iconData});
}

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNotes(Note note) {
    _notes.add(note);
    notifyListeners();
  }
}

class NotesCard extends StatelessWidget {
  final Note note;

  const NotesCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.description ?? ""),
        trailing: Icon(note.iconData ?? Icons.abc),
      ),
    );
  }
}
