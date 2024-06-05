import 'package:flutter/material.dart';
import 'package:mylearning/features/user/user_login/page/login_page.dart';
import 'package:mylearning/features/user/user_sign_up/page/sign_up_page.dart';

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
      return LoginScreen(
        show: go,
      );
    } else {
      return SignUpScreen(show: go);
    }
  }
}
