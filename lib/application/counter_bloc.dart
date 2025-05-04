import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(count: 0)) {
    on<CounterEvent>((event, emit) {
      event.map(
        increment: (_) => emit(CounterState(count: state.count + 1)),
        decrement: (_) => emit(CounterState(count: state.count - 1)),
        reset: (_) => emit(const CounterState(count: 0)),
      );
    });
  }
}
