bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

bool validatePassword(String value) {
  String pattern = '(?=.*[0-9a-zA-Z]).{8,}';
  RegExp regex = RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

String? emailValidator(value) {
  if (value == null) {
    return 'Enter an email';
  }
  if (!validateEmail(value)) {
    return 'Enter a valid email';
  }
  return null;
}

String? passwordValidator(value) {
  if (value == null) {
    return 'Enter a password';
  }
  if (!validatePassword(value)) {
    return 'Password must be at least 8 charecters';
  }
  return null;
}

String? lengthValidator(value, int length) {
  if (value != null && value.length > 3) {
    return null;
  }

  return 'Minimum of three charecters';
}
