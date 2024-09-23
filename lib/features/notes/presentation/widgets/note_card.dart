import 'package:flutter/material.dart';
import 'package:mylearning/features/notes/data/note_provider_class.dart';

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
