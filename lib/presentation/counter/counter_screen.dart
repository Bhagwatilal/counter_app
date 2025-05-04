import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/counter_bloc.dart';
import '../../../application/counter_event.dart';
import '../../../application/counter_state.dart';
import '../../../infrastructure/core/storage/token_storage.dart';
import 'package:go_router/go_router.dart';
part 'widget/counter_button.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: BlocBuilder<CounterBloc, CounterState>(
            buildWhen: (previous, current) => previous.count != current.count,
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Reset Counter',
                onPressed: () {
                  context.read<CounterBloc>().add(const CounterEvent.reset());
                },
              );
            },
          ),
          title: const Text(
            'BLoC Counter',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          actions: [
            IconButton(
              icon: const Icon(Icons.people),
              tooltip: 'View Users',
              onPressed: () {
                context.pushNamed('users');
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () async {
                await TokenStorage.deleteToken();
                if (context.mounted) {
                  context.goNamed('login');
                }
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.3),
                    Theme.of(context).colorScheme.background,
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 80), // Add padding for FABs
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<CounterBloc, CounterState>(
                        buildWhen: (previous, current) =>
                            previous.count != current.count,
                        builder: (context, state) {
                          return Column(
                            children: [
                              const Text(
                                'Current Count',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 24),
                              TweenAnimationBuilder<double>(
                                duration: const Duration(milliseconds: 500),
                                tween: Tween(begin: 0, end: 1),
                                builder: (context, value, child) {
                                  return Transform.scale(
                                    scale: 0.8 + (0.2 * value),
                                    child: Container(
                                      width: 200,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 24, horizontal: 32),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.7),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(24),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.3),
                                            blurRadius: 20,
                                            offset: const Offset(0, 10),
                                          ),
                                          BoxShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.2),
                                            blurRadius: 40,
                                            offset: const Offset(0, -10),
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          // Background decorative elements
                                          Positioned(
                                            right: -20,
                                            top: -20,
                                            child: Icon(
                                              Icons.circle,
                                              size: 100,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer
                                                  .withOpacity(0.1),
                                            ),
                                          ),
                                          // Counter value with animation
                                          TweenAnimationBuilder<double>(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            tween: Tween(
                                                begin:
                                                    state.count.toDouble() - 1,
                                                end: state.count.toDouble()),
                                            builder: (context, value, child) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    value.toInt().toString(),
                                                    style: TextStyle(
                                                      fontSize: 64,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                      shadows: [
                                                        Shadow(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          offset: const Offset(
                                                              0, 4),
                                                          blurRadius: 8,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  AnimatedOpacity(
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    opacity: value % 1 > 0.5
                                                        ? 1 - (value % 1)
                                                        : value % 1,
                                                    child: Container(
                                                      width: 40,
                                                      height: 4,
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimaryContainer
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
          buildWhen: (previous, current) => previous.count != current.count,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    heroTag: 'decrement',
                    onPressed: () {
                      context
                          .read<CounterBloc>()
                          .add(const CounterEvent.decrement());
                    },
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: 'increment',
                    onPressed: () {
                      context
                          .read<CounterBloc>()
                          .add(const CounterEvent.increment());
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
