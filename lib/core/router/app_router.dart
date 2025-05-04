import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../presentation/login_form/widget/login_form_screen.dart';
import '../../presentation/counter/counter_screen.dart';
import '../../presentation/user_list/user_list_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginFormScreen(),
    ),
    GoRoute(
      path: '/counter',
      name: 'counter',
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      path: '/users',
      name: 'users',
      builder: (context, state) => const UserListScreen(),
    ),
  ],
);
