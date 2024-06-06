import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/user_layout/user_layout_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback show;

  const LoginPage({super.key, required this.show});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  FocusNode emailFocus = FocusNode();
  final TextEditingController password = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return UserLayoutScreen(
      children: <Widget>[
        Center(
          child: Image.asset(
            alignment: Alignment.center,
            'lib/assets/4.jpg',
            width: 200,
            height: 200,
          ),
        ),
        //I need to add a form here and the key is the one that will validate the user
        const Text("Login"),
        LongTextFieldForm(
          focusNode: emailFocus,
          validator: null,
          obsureText: false,
          showIcon: false,
          hintText: Strings.email,
          labelText: Strings.email,
          onChanged: (value) {},
          controller: email,
        ),
        const SizedSpace(),
        LongTextFieldForm(
          focusNode: passwordFocus,
          validator: null,
          obsureText: false,
          showIcon: false,
          hintText: Strings.password,
          labelText: Strings.password,
          controller: password,
          onChanged: (value) {},
        ),
        const SizedSpace(),
        LongButton(
          onTap: widget.show,
          title: "Signup",
        )
      ],
    );
  }
}
