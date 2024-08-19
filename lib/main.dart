import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mylearning/features/auth/auth.dart';
import 'package:mylearning/features/notes/presentation/screen/notes_screen.dart';
import 'package:mylearning/features/upcoming_events/upcoming_event_screen/pages/upcoming_screen.dart';
import 'package:mylearning/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("myBox");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Gemini.init(apiKey: "AIzaSyCvFjc2RVFJv6V22IAnzHgPjx5aj8_LCgg");
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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
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
        home: AuthState(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
      ),
    );
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
}
