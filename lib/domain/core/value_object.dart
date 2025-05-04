class EmailAddress {
  final String value;

  EmailAddress(this.value);

  bool isValid() {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
  }
}

class Password {
  final String value;

  Password(this.value);

  bool isValid() {
    return value.length >= 6;
  }
}
