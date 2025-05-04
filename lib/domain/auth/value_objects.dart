// import '../core/value_object.dart';

// class EmailAddress extends ValueObject<String> {
//   @override
//   final String value;

//   EmailAddress(this.value);

//   @override
//   bool isValid() => value.contains('@');
// }

// class Password extends ValueObject<String> {
//   @override
//   final String value;

//   Password(this.value);

//   @override
//   bool isValid() {
//     if (value.length < 8) return false;

//     final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
//     final hasLowercase = RegExp(r'[a-z]').hasMatch(value);
//     final hasDigit = RegExp(r'\d').hasMatch(value);
//     final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

//     return hasUppercase && hasLowercase && hasDigit && hasSpecialChar;
//   }
// }
