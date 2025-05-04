import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../application/login_form/login_form_bloc.dart';
import '../../../application/login_form/login_form_event.dart';

import '../../../application/login_form/login_form_state.dart';
//import '../../../application/login_form/login_form_event.dart';
import '../../core/button/text_input/custom_text_input.dart';
import '../../core/button/custom_button.dart';
import '../../core/snackbar/custom_snackbar.dart';
//import '../../counter/counter_screen.dart';
import '../../../infrastructure/core/storage/token_storage.dart';
import '../../../infrastructure/repository/login_form_repository.dart';

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginFormBloc(iLoginFormRepository: LoginFormRepository()),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                Theme.of(context).colorScheme.background,
              ],
            ),
          ),
          child: SafeArea(
            child: BlocConsumer<LoginFormBloc, LoginFormState>(
              listenWhen: (previous, current) =>
                  previous.isSubmitting != current.isSubmitting ||
                  previous.apiResponse != current.apiResponse,
              listener: (context, state) async {
                log('Listener called with state: $state');
                if (state.apiResponse != null) {
                  if (state.apiResponse!.isRight()) {
                    // final token =
                    //     state.apiResponse!.getOrElse(() => null)?.token;

                    // if (token != null) {
                    //   await TokenStorage.saveToken(token);
                    // }

                    CustomSnackbar.show(
                      context,
                      message: 'Login successful!',
                      backgroundColor: Colors.green,
                    );

                    // Replace Navigator with GoRouter
                    if (context.mounted) {
                      context.pushNamed('counter');
                    }
                  } else {
                    context.goNamed('counter');
                    CustomSnackbar.show(
                      context,
                      message: state.apiResponse!.fold((l) => l, (r) => ''),
                      backgroundColor: Colors.red,
                    );
                  }
                }
              },
              builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 32),
                            Text(
                              'Login',
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),

                            // Email Field
                            CustomTextInput(
                              label: 'Email',
                              value: state.email.value,
                              onChanged: (email) => context
                                  .read<LoginFormBloc>()
                                  .add(EmailChanged(email)),
                              prefixIcon: const Icon(Icons.email_outlined),
                              keyboardType: TextInputType.emailAddress,
                              errorText: state.showErrorMessages
                                  ? (state.email.isValid()
                                      ? null
                                      : 'Invalid Email')
                                  : null,
                            ),
                            const SizedBox(height: 24),

                            // Password Field
                            CustomTextInput(
                              label: 'Password',
                              value: state.password.value,
                              onChanged: (password) => context
                                  .read<LoginFormBloc>()
                                  .add(PasswordChanged(password)),
                              obscureText: true,
                              prefixIcon: const Icon(Icons.lock_outline),
                              errorText: state.showErrorMessages
                                  ? (state.password.isValid()
                                      ? null
                                      : 'Invalid Password')
                                  : null,
                            ),
                            const SizedBox(height: 32),

                            // Login Button
                            CustomButton(
                              label: state.isSubmitting
                                  ? 'Logging in...'
                                  : 'Login',
                              onPressed: state.isSubmitting
                                  ? () {}
                                  : () {
                                      context
                                          .read<LoginFormBloc>()
                                          .add(LoginPressed(
                                            state.email.value,
                                            state.password.value,
                                          ));
                                    },
                            ),

                            const Spacer(),

                            // Footer
                            Text(
                              'Made with ❤️',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
