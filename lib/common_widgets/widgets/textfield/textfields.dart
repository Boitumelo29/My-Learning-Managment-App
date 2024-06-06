import 'package:flutter/material.dart';

class LongTextField extends StatelessWidget {
  //final GlobalKey globalkey;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool? suffexIcon;

  const LongTextField(
      {super.key,
      // required this.globalkey,
      required this.controller,
      required this.hintText,
      required this.labelText,
      this.suffexIcon});

  @override
  Widget build(BuildContext context) {
    bool passwordVisible = false;
    // suffexIcon = false;
    return TextFormField(
      //  key: globalkey,
      controller: controller,
      decoration: InputDecoration(
        // suffix: suffexIcon ? Icon(Icons.remove_red_eye) : Icon(Icons.remove_red_eye),

        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class LongTextFieldForm extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool? suffexIcon;

  const LongTextFieldForm(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      this.suffexIcon});

  @override
  State<LongTextFieldForm> createState() => _LongTextFieldFormState();
}

class _LongTextFieldFormState extends State<LongTextFieldForm> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordVisible,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
          icon: Icon(passwordVisible
              ? Icons.visibility_sharp
              : Icons.visibility_off_sharp),
        ),
        // suffix: suffexIcon ? Icon(Icons.remove_red_eye) : Icon(Icons.remove_red_eye),
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30)),
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }
}
