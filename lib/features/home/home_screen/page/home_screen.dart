import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/no_app_bar_screen.dart';

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
      children: const [
        Text("Hello world"),
      ],
    );
  }
}
