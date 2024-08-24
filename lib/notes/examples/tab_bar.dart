import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/features/chatbot/presenation/screens/chatbot_screen.dart';
import 'package:mylearning/features/home/home_screen/page/home_screen.dart';
import 'package:mylearning/features/my_study/presentation/page/my_study_page.dart';
import 'package:mylearning/features/notes/presentation/screen/notes_screen.dart';
import 'package:mylearning/features/upcoming_events/upcoming_event_screen/pages/upcoming_screen.dart';

class TabBarScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  const TabBarScreen(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    List<Widget> tabItems = [
      HomePage(isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme),
      const ChatBotPage(),
      const MyStudyPage(),
      const NotesScreen(),
      const UpcomingEvents(),
    ];

    return Scaffold(
        body: Center(
          child: tabItems[_selectedIndex],
        ),
        bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          iconSize: 30,
          //showElevation: false,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.chat),
              title: const Text('My Chat'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.abc),
              title: const Text('My Study'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.note_alt_outlined),
              title: const Text('My Notes'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.date_range),
              title: const Text('Events'),
            ),
          ],
        ));
  }
}

