import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';
import 'package:mylearning/util/validation/validation.dart';

class SignupConfirmPassword extends StatelessWidget {
  final TextEditingController passwordConfirm;
  final FocusNode passwordConfirm_f;
  final TextEditingController password;
  const SignupConfirmPassword({super.key, required this.passwordConfirm, required this.passwordConfirm_f, required this.password});

  @override
  Widget build(BuildContext context) {
    return  LongTextFieldForm(
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
        return Validation.passwordConformValidation(
            passwordConfirm.text, password.text);
      },
    );
  }
}
