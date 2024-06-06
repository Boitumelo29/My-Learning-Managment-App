class Validation {
  static String? emailValidation(String value) {
    if (value.isEmpty ||
        !RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return "Email is not valid";
    }
    return null;
  }

  static String? passwordValidation(String value) {
    if (value.isEmpty) {
      return "Email is not valid";
    } else if (value =< 6) {
      return "Please enter 6+ digits";
    }
    return null;
  }
}