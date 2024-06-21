import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List profileScreenDet = [
      {
        "icon": const Icon(Icons.person),
        "name": "Edit Profile",
        "navigation": MaterialPageRoute(
            builder: (BuildContext context) => const ExamplePage())
      },
      {
        "icon": const Icon(Icons.settings),
        "name": "Account settings",
        "navigation": MaterialPageRoute(
            builder: (BuildContext context) => const ExamplePage())
      },
      {
        "icon": const Icon(Icons.help),
        "name": "Help",
        "navigation": MaterialPageRoute(
            builder: (BuildContext context) => const ExamplePage())
      },
    ];

    return AppBarScreen(shouldScroll: false, children: []);
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
