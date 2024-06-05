import 'package:flutter/material.dart';

class LongTextField extends StatelessWidget {
  //final GlobalKey globalkey;
  final String hintText;
  final String labelText;

  const LongTextField(
      {super.key,
      // required this.globalkey,
      required this.hintText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //  key: globalkey,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
