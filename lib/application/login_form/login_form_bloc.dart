import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import '../../infrastructure/data_source/login_api.dart';
import '../../infrastructure/login_form/dto/login_response_dto.dart';
import 'login_form_event.dart';
import 'login_form_state.dart';
import '../../domain/core/value_object.dart';
import 'package:counter_app/domain/repository/i_login_form_repository.dart';
//import 'login_form_event.freezed.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final LoginApi _loginApi = LoginApi();
  final ILoginFormRepository iLoginFormRepository;

  LoginFormBloc({required this.iLoginFormRepository})
      : super(LoginFormState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<StoreToken>(_onTokenUpdated);
    on<LoginPressed>(_onLoginPressed);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginFormState> emit) {
    final email = EmailAddress(event.email);
    emit(state.copyWith(
      email: email,
      isValid: email.isValid() && state.password.isValid(),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginFormState> emit) {
    final password = Password(event.password);
    emit(state.copyWith(
      password: password,
      isValid: state.email.isValid() && password.isValid(),
    ));
  }

  void _onTokenUpdated(
    StoreToken event,
    Emitter<LoginFormState> emit,
  ) {
    emit(state.copyWith(
      isValid: state.email.isValid() && state.password.isValid(),
    ));
    iLoginFormRepository.storetoken(event.token);
  }

  Future<void> _onLoginPressed(
    LoginPressed event,
    Emitter<LoginFormState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(isSubmitting: true));

      try {
        final response = await iLoginFormRepository.login(
          username: event.email,
          password: event.password,
        );

        emit(state.copyWith(
          isSubmitting: false,
          apiResponse: right(response),
        ));
      } catch (e) {
        emit(state.copyWith(
          isSubmitting: false,
          apiResponse: left(e.toString()),
        ));
      }
    }
  }
}
