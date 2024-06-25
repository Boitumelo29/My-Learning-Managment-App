import 'package:flutter/material.dart';
import 'package:mylearning/util/navigation/tab_bar.dart';

void main() {
  runApp(const MyApp());
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
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme:
            ThemeData(primarySwatch: Colors.red, brightness: Brightness.light),
        darkTheme:
            ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: TabBarScreen(
            isDarkMode : isDarkMode,
            toggleTheme: toggleTheme(isDarkMode)));
  }

  toggleTheme(bool isDarkMode) {
    setState(() {
      this.isDarkMode = isDarkMode;
    });
  }
}
