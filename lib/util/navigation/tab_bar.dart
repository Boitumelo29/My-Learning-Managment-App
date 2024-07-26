import 'package:flutter/material.dart';
import 'package:mylearning/features/home/home_screen/page/home_screen.dart';
import 'package:mylearning/features/notes/presentation/screen/notes_screen.dart';
import 'package:mylearning/features/profile/profile_screen/page/profile_page.dart';
import 'package:mylearning/features/timetable/timetable_screen/page/timetable_screen.dart';
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
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: const TabBar(
            tabs: [Icon(Icons.home),Icon(Icons.table_chart_sharp), Icon(Icons.note_alt_outlined), Icon(Icons.date_range), Icon(Icons.person)]),
        body: TabBarView(
          children: [
            const HomePage(),
            const TimetablePage(),
            const NotesScreen(),
            const UpcomingEvents(),
            ProfilePage(isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme)
          ],
        ),
      ),
    );
  }
}
