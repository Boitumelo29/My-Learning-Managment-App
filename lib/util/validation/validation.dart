import 'package:flutter/cupertino.dart';

class Validation {
  static emailValidation(String value) {
    if (value.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return "Email is not valid";
    }
  }

  static passwordValidation(String value) {
    if (value.isEmpty) {
      return "Password is not valid";
    } else if (value.length <= 6) {
      return "Password must be longer than 6 characters";
    }
  }

  static passwordConformValidation(String value, String confirmValue) async {
    if (value.isEmpty) {
      return "Password is not valid";
    } else if (value != confirmValue) {
      return "Password does not match";
    }
  }

  static usernameValidation(String value) {
    if (value.isEmpty) {
      return "Username is empty";
    } else if (value.length <= 3) {
      return "Username must be longer than 3 characters";
    }
  }
}
