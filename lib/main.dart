import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mylearning/features/auth/auth.dart';
import 'package:mylearning/features/auth/bloc/auth_bloc.dart';
import 'package:mylearning/features/home/data/model/streak_model.dart';
import 'package:mylearning/features/my_study/features/flash_cards/data/model/flashcard.dart';
import 'package:mylearning/features/notes/presentation/screen/notes_screen.dart';
import 'package:mylearning/features/profile/edit_profile/data/image_model.dart';
import 'package:mylearning/features/upcoming_events/upcoming_event_screen/pages/upcoming_screen.dart';
import 'package:mylearning/firebase_options.dart';
import 'package:mylearning/network/network_checker.dart';
import 'package:provider/provider.dart';
import 'features/auth/data/auth_repo.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<InternetConnection>(
      () => InternetConnectionImpl());
  await Hive.initFlutter();
  Hive.registerAdapter(ImageModelAdapter());
  Hive.registerAdapter(FlashCardAdapter());
  Hive.registerAdapter(StreakModelAdapter());
  await Hive.openBox<ImageModel>('images');
  await Hive.openBox<FlashCard>('flashcards');
  await Hive.openBox("myBox");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Gemini.init(apiKey: "AIzaSyCvFjc2RVFJv6V22IAnzHgPjx5aj8_LCgg");
  final authRepo = AuthRepository();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NoteProvider>(create: (context) => NoteProvider()),
      ChangeNotifierProvider(create: (_) => EventModel())
    ],
    child: BlocProvider(
      create: (context) => AuthBloc(authRepo: authRepo),
      child: const MyApp(),
    ),
  ));
}

void setupLocator() async {}

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
      builder: (context, child) => BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return MaterialApp(
              // theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
              themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.grey[50],
                  primaryColor: Colors.red,
                  primaryColorLight: Colors.red,
                  primaryColorDark: Colors.red[900]),
              //theme: ThemeData(primarySwatch: Colors.red, brightness: Brightness.light),
              darkTheme: ThemeData(
                  primarySwatch: Colors.red, brightness: Brightness.dark),
              debugShowCheckedModeBanner: false,
              home: const AuthPage());
        },
      ),
    );
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
}
