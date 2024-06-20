import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/user_layout/user_layout_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';
import 'package:mylearning/util/validation/validation.dart';

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
            LongTextFieldForm(
              controller: username,
              focusNode: username_f,
              hintText: "Username",
              labelText: "Username",
              obsureText: false,
              showPrefixIcon: true,
              prefixIcon: Icons.person,
              showSuffixIcon: false,
              onChanged: (value) {},
              validator: (value) {
                Validation.usernameValidation(value);
              },
            ),
            LongTextFieldForm(
              controller: email,
              focusNode: email_f,
              hintText: Strings.email,
              labelText: Strings.email,
              obsureText: false,
              showPrefixIcon: true,
              prefixIcon: Icons.email_outlined,
              showSuffixIcon: false,
              onChanged: (value) {},
              validator: (value) {
                Validation.usernameValidation(value);
              },
            ),
            LongTextFieldForm(
              controller: password,
              focusNode: password_f,
              hintText: Strings.password,
              labelText: Strings.password,
              obsureText: false,
              showPrefixIcon: true,
              prefixIcon: Icons.person,
              showSuffixIcon: false,
              onChanged: (value) {},
              validator: (value) {
                Validation.usernameValidation(value);
              },
            ),
            LongTextFieldForm(
              controller: passwordConfirm,
              focusNode: passwordConfirm_f,
              hintText: "Confirm Password",
              labelText: "Confirm Password",
              obsureText: false,
              showPrefixIcon: true,
              prefixIcon: Icons.person,
              showSuffixIcon: false,
              onChanged: (value) {},
              validator: (value) {
                Validation.passwordConformValidation(
                    passwordConfirm.text, password.text);
              },
            ),
            LongButton(onTap: widget.show ?? () {}, title: Strings.password)
          ],
        )),
      ],
    );
  }
}
