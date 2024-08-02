import 'package:flutter/material.dart';
import 'package:mylearning/features/chatbot/presenation/screens/chatbot_screen.dart';
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
    return  DefaultTabController(
      length: 5,

      ///todo: if no network then we display this, if network then we dispay the other.
      child: Scaffold(
        bottomNavigationBar:const TabBar(tabs: [
          Icon(Icons.home),
          Icon(Icons.chat),
          Icon(Icons.note_alt_outlined),
          Icon(Icons.date_range),
          Icon(Icons.table_chart_sharp)
        ]),
        body: TabBarView(
          children: [
            HomePage(
                isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme),
            const ChatBotPage(),
            const NotesScreen(),
           const UpcomingEvents(),
           const  TimetablePage()

            ///todo instead of a profile screen we can have a drawer so we can keep all of our screens, then keep the dark mode setting in there
            // ProfilePage(
            //     isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme)
          ],
        ),
      ),
    );
  }
}
