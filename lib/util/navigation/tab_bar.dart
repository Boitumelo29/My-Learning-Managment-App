import 'package:flutter/material.dart';
import 'package:mylearning/features/home/home_screen/page/home_screen.dart';
import 'package:mylearning/features/profile/profile_screen/page/profile_page.dart';

class TabBarScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> toggleTheme;

  const TabBarScreen(
      {super.key, required this.toggleTheme, required this.isDarkMode});

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
        body: TabBarView(
          children: [
            const HomePage(),
            const Icon(Icons.home),
            ProfilePage(
                isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme)
          ],
        ),
      ),
    );
  }
}
