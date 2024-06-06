class Validation {
  static emailValidation(String value) {
    if (value.isNotEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return " Email is not valid";
    }
    return null;
  }
}
