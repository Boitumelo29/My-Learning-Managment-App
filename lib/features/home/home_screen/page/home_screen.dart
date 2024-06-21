import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';

class HomePage extends StatefulWidget {
  // final String title = "title";

  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppBarScreen(shouldScroll: false, children: [Text("Hellow world")]);
  }
}
