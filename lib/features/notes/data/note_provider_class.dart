import 'package:flutter/material.dart';

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