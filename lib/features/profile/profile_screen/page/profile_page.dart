import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';

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

    return AppBarScreen(shouldScroll: false, children: [
      const Column(
        children: [Icon(Icons.person), SizedSpace(), Text("Name")],
      ),
      const SizedSpace(
        height: 40,
      ),
      ListView.separated(
          itemBuilder: (context, index) {},
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: profileScreenDet.length)
    ]);
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
