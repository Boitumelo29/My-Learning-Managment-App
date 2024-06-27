import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
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
      title: Strings.settings,
      shouldScroll: true,
      children: [
        Switch(
            value: widget.isDarkMode,
            onChanged: (value) {
              print("tapped");
              widget.toggleTheme();
            })

        //Its needs to be alis view with a
        //notifications
        //help
        //FAQ
        //dark mode
        //leave feedback
      ],
    );
  }
}
