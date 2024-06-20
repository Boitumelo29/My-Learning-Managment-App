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
      children: [
        const SizedSpace(
          height: 40,
        ),
        const Text(
          Strings.myLearning,
          style: TextStyle(color: Colors.red, fontSize: 40),
        ),
        const SizedSpace(
          height: 40,
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
                    return Validation.emailValidation(value ?? "testing");
                  },
                  obsureText: false,
                  showSuffixIcon: false,
                  hintText: Strings.email,
                  labelText: Strings.email,
                  onChanged: (value) {},
                  controller: email,
                ),
                const SizedSpace(
                  height: 10,
                ),
                LongTextFieldForm(
                  focusNode: passwordFocus,
                  validator: (value) {
                    return Validation.passwordValidation(value);
                  },
                  obsureText: true,
                  showSuffixIcon: true,
                  hintText: Strings.password,
                  labelText: Strings.password,
                  controller: password,
                  onChanged: (value) {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.show;
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                const SizedSpace(),
                LongButton(
                  onTap: () {
                    widget.show;
                    emailFocus.unfocus();
                    passwordFocus.unfocus();
                    if (_formKey.currentState!.validate()) {
                      widget.show;
                    }
                  },
                  title: Strings.signUp,
                ),
                const SizedSpace(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(Strings.doNotHaveAnAccount),
                    GestureDetector(
                      onTap: () {
                        widget.show;
                      },
                      child: const Text(
                        Strings.signUp,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
