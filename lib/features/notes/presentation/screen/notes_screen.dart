import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/validation/validation.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController controller = TextEditingController();
  final _key = GlobalKey<ExpandableFabState>();
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Notes & Todos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<NoteProvider>(
          builder: (context, noteProvider, child) {
            return ListView.builder(
              itemCount: noteProvider.notes.length,
              itemBuilder: (context, index) {
                return NotesCard(note: noteProvider.notes[index]);
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        distance: 50,
        type: ExpandableFabType.up,
        key: _key,
        overlayStyle: ExpandableFabOverlayStyle(
            color: Colors.red.withOpacity(0.5), blur: 10),
        onOpen: () {},
        afterOpen: () {},
        onClose: () {},
        afterClose: () {},
        children: [
          FloatingActionButton.small(
            backgroundColor: Colors.red,
            heroTag: null,
            child: const Icon(Icons.task),
            onPressed: () => _showInputAlert(context),
          ),
          FloatingActionButton.small(
              backgroundColor: Colors.red,
              heroTag: null,
              child: const Icon(Icons.draw),
              onPressed: () {}),
        ],
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
                    validator: (value) {
                      Validation.usernameValidation(value);
                    },
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
