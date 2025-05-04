import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_event.freezed.dart';

@freezed
class LoginFormEvent with _$LoginFormEvent {
  const factory LoginFormEvent.emailChanged(String email) = EmailChanged;
  const factory LoginFormEvent.passwordChanged(String password) =
      PasswordChanged;
  const factory LoginFormEvent.loginPressed(String email, String password) =
      LoginPressed;
  const factory LoginFormEvent.storeToken(String token) = StoreToken;
  //const factory LoginFormEvent.submitted() = Submitted;
}
