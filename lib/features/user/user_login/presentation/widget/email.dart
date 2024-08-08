import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';
import 'package:mylearning/util/validation/validation.dart';

class LoginEmail extends StatelessWidget {
  final TextEditingController email;
  final  FocusNode emailFocus;

  const LoginEmail({super.key, required this.email, required this.emailFocus});

  @override
  Widget build(BuildContext context) {
    return LongTextFieldForm(
      isRed: false,
      showPrefixIcon: true,
      prefixIcon: Icons.email_outlined,
      focusNode: emailFocus,
      validator: (value) {
        return Validation.emailValidation(value);
      },
      obsureText: false,
      showSuffixIcon: false,
      hintText: Strings.email,
      labelText: Strings.email,
      onChanged: (value) {},
      controller: email,
    );
  }
}
