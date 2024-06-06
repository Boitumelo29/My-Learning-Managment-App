import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/user_layout/user_layout_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';
import 'package:mylearning/util/validation/validation.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback show;

  const LoginPage({super.key, required this.show});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController password = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return UserLayoutScreen(
      children: <Widget>[
        const Text(
          Strings.myLearning,
          style: TextStyle(color: Colors.red, fontSize: 40),
        ),
        const SizedSpace(
            // height: 40,
            ),
        Center(
          child: Image.asset(
            alignment: Alignment.center,
            'lib/assets/4.jpg',
            width: 200,
            height: 200,
          ),
        ),
        Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                LongTextFieldForm(
                  focusNode: emailFocus,
                  validator: (value) {
                    Validation.emailValidation(value);
                  },
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
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      widget.show;
                    }
                  },
                  title: "Signup",
                )
              ],
            ))
      ],
    );
  }
}
