import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/user_layout/user_layout_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback? show;

  const SignUpPage({super.key, this.show});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final email = TextEditingController();
  FocusNode email_f = FocusNode();
  final username = TextEditingController();
  FocusNode username_f = FocusNode();
  final password = TextEditingController();
  FocusNode password_f = FocusNode();
  final passwordConfirm = TextEditingController();
  FocusNode passwordConfirm_f = FocusNode();

  @override
  Widget build(BuildContext context) {
    return UserLayoutScreen(
      children: [
        const SizedSpace(),
        const Text(Strings.myLearning),
        const SizedSpace(),
        Center(
          child: Image.asset(
            "lib/assets/5.jpg",
            width: 200,
            height: 200,
          ),
        ),
        Form(
            child: Column(
          children: <Widget>[
            LongTextField(
                controller: username,
                hintText: "Username",
                labelText: "Username"),
            LongButton(onTap: widget.show ?? () {}, title: "login")
          ],
        )),
      ],
    );
  }
}
