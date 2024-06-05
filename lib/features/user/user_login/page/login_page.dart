import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/user_layout/user_layout_screen.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback show;

  const LoginPage({super.key, required this.show});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  FocusNode email_f = FocusNode();
  final password = TextEditingController();
  FocusNode password_f = FocusNode();

  @override
  Widget build(BuildContext context) {
    return UserLayoutScreen(
      children:[],
    );
  }
}
