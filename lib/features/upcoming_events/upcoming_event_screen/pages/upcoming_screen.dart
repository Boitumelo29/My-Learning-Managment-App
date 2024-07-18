import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';

class UpcomingEvents extends StatefulWidget {
  const UpcomingEvents({super.key});

  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  @override
  Widget build(BuildContext context) {
    return AppBarScreen(shouldScroll: true, title: "", children: []);
  }
}
