import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import '../../domain/auth/value_objects.dart';
import '../../domain/core/value_object.dart';
import 'login_form_bloc.dart';

part 'login_form_state.freezed.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const LoginFormState._();

  const factory LoginFormState({
    required EmailAddress email,
    required Password password,
    required bool isSubmitting,
    required bool isValid,
    //required bool isLoading,
    Either<String, dynamic>? apiResponse,
  }) = _LoginFormState;

  EmailAddress get email => throw UnimplementedError();
  Password get password => throw UnimplementedError();

  factory LoginFormState.initial() => LoginFormState(
        email: EmailAddress(''),
        password: Password(''),
        isSubmitting: false,
        isValid: false,
        apiResponse: null,
      );

  bool get showErrorMessages =>
      !this.email.isValid() || !this.password.isValid();
}
