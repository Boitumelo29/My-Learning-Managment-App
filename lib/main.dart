import 'package:flutter/material.dart';
import 'package:mylearning/features/notes/presentation/screen/notes_screen.dart';
import 'package:mylearning/features/upcoming_events/upcoming_event_screen/pages/upcoming_screen.dart';
import 'package:mylearning/util/navigation/tab_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NoteProvider>(create: (context) => NoteProvider()),
      ChangeNotifierProvider(create: (_) => EventModel())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
          primaryColor: Colors.red,
          primaryColorLight: Colors.red,
          primaryColorDark: Colors.red[900]),
      //theme: ThemeData(primarySwatch: Colors.red, brightness: Brightness.light),
      darkTheme:
          ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: TabBarScreen(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
    );
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
}
