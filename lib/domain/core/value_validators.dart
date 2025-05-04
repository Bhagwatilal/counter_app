import 'package:dartz/dartz.dart';
import 'failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex = r"""^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure(
      failedValue: input,
      message: "Invalid email format.",
    ));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length < 8 ||
      !RegExp(r'[A-Z]').hasMatch(input) ||
      !RegExp(r'[a-z]').hasMatch(input) ||
      !RegExp(r'[0-9]').hasMatch(input) ||
      !RegExp(r'[!@#\$&*~]').hasMatch(input)) {
    return left(ValueFailure(
      failedValue: input,
      message:
          "Password must be at least 8 characters and include upper, lower, digit, and special character.",
    ));
  } else {
    return right(input);
  }
}
