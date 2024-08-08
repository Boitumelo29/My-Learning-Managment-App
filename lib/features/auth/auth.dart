import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/features/user/user_login/presentation/pages/login_page.dart';
import 'package:mylearning/features/user/user_sign_up/page/sign_up_page.dart';
import 'package:mylearning/util/navigation/tab_bar.dart';

class AuthState extends StatelessWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  const AuthState(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return TabBarScreen(isDarkMode: isDarkMode, toggleTheme: toggleTheme);
        }
        return AuthPage();
      },
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool a = true;

  void go() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LoginPage(
        show: go,
      );
    } else {
      return SignUpPage(show: go);
    }
  }
}
