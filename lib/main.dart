import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application/counter_bloc.dart';
import 'application/login_form/login_form_bloc.dart';
//import 'presentation/login_form/widget/login_form_screen.dart';
import './core/router/app_router.dart';
import 'package:get_it/get_it.dart';
import 'infrastructure/repository/login_form_repository.dart';

final getIt = GetIt.instance;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(
            create: (_) =>
                LoginFormBloc(iLoginFormRepository: LoginFormRepository())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
        title: 'Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
