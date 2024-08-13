import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';
import 'package:mylearning/util/validation/validation.dart';

class SignupUsername extends StatelessWidget {
  final TextEditingController username;
  final FocusNode username_f;
  const SignupUsername({super.key, required this.username, required this.username_f});

  @override
  Widget build(BuildContext context) {
    return LongTextFieldForm(
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
    );
  }
}
