import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';

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
      children: [
      ],
    );
  }

  _showInputAlert(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog();
    });
  }
}


