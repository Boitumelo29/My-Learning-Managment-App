import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final email = TextEditingController();
  FocusNode email_f = FocusNode();
  final username = TextEditingController();
  FocusNode username_f = FocusNode();
  final password = TextEditingController();
  FocusNode password_f = FocusNode();
  final passwordConfirm = TextEditingController();
  FocusNode passwordConfirm_f = FocusNode();

  Future<void> _signup() async {
    setState(() {});

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // Handle successful signup here
      print("Signed up: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      // Handle signup errors here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Signup failed"),
        ),
      );
    } finally {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return UserLayoutScreen(
      children: [
        const SizedSpace(),
        const Text(
          Strings.myLearning,
          style: TextStyle(color: Colors.red, fontSize: 35),
        ),
        const SizedSpace(),
        Center(
          child: Image.asset(
            "lib/assets/5.jpg",
            width: 160,
            height: 160,
          ),
        ),
        Form(
            child: Column(
          children: <Widget>[
            LongTextFieldForm(
              isRed: false,
              controller: username,
              focusNode: username_f,
              hintText: Strings.username,
              labelText: Strings.username,
              obsureText: false,
              showPrefixIcon: true,
              prefixIcon: Icons.person,
              showSuffixIcon: false,
              onChanged: (value) {},
              validator: (value) {
                Validation.usernameValidation(value);
              },
            ),
            const SizedSpace(
              height: 10,
            ),
            LongTextFieldForm(
              isRed: false,
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
            const SizedSpace(
              height: 10,
            ),
            LongTextFieldForm(
              isRed: false,
              controller: password,
              focusNode: password_f,
              hintText: Strings.password,
              labelText: Strings.password,
              obsureText: true,
              showPrefixIcon: true,
              prefixIcon: Icons.password,
              showSuffixIcon: true,
              onChanged: (value) {},
              validator: (value) {
                Validation.usernameValidation(value);
              },
            ),
            const SizedSpace(
              height: 10,
            ),
            LongTextFieldForm(
              isRed: false,
              controller: passwordConfirm,
              focusNode: passwordConfirm_f,
              hintText: Strings.confirmPassword,
              labelText: Strings.confirmPassword,
              obsureText: true,
              showPrefixIcon: true,
              prefixIcon: Icons.password,
              showSuffixIcon: true,
              onChanged: (value) {},
              validator: (value) {
                Validation.passwordConformValidation(
                    passwordConfirm.text, password.text);
              },
            ),
            TextButton(
              onPressed: widget.show,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "login",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            LongButton(
                onTap: () {
                  _signup();
                },
                title: Strings.signUp),
          ],
        )),
      ],
    );
  }
}
