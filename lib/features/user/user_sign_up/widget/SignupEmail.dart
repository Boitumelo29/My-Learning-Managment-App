import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';
import 'package:mylearning/util/validation/validation.dart';

class SignupEmail extends StatelessWidget {
  final TextEditingController email;
  final FocusNode email_f;
  const SignupEmail({super.key, required this.email, required this.email_f});

  @override
  Widget build(BuildContext context) {
    return  LongTextFieldForm(
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
    );
  }
}
