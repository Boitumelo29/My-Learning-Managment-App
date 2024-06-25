import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
        shouldScroll: true, children: [
          //notifications
      //help
      //FAQ
      //dark mode
      //leave feedback


    ], title: Strings.settings);
  }
}
