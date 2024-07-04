import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  const SettingsPage(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
      // you can change this to a slide up
      title: Strings.settings,
      shouldScroll: true,
      children: [
        Row(
          children: [
            const Text("Theme of App"),
            const SizedSpace(),
            Switch(
                value: widget.isDarkMode,
                onChanged: (value) {
                  print("tapped");
                  widget.toggleTheme();
                }),
          ],
        ),
        const SizedSpace(),
        Row(
          children: [
            const Text("Push Notifications"),
            Switch(
                value: widget.isDarkMode,
                onChanged: (value) {
                  print("tapped");
                  widget.toggleTheme();
                }),
          ],
        ),
      ],
    );
  }
}
