import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
      shouldScroll: false,
      shouldHaveFloatingButton: false,
      title: 'Home Screen',
      children: [
        const Text("Hello world"),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: Text("The Qoute of the day"),
        ),
        Text("Quote of the day in a container"),
        Text("Upcoming events"),
        Text("Jobs"),
      ],
    );
  }
}
