import 'package:flutter/material.dart';
import 'package:mylearning/features/home/home_screen/page/home_screen.dart';
import 'package:mylearning/features/profile/profile_screen/page/profile_page.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("title"),
        ),
        bottomNavigationBar: const TabBar(
            tabs: [Icon(Icons.home), Icon(Icons.home), Icon(Icons.person)]),
        body: const TabBarView(
          children: [HomePage(), Icon(Icons.home), ProfilePage()],
        ),
      ),
    );
  }
}
