import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _counter = 0;

  CounterBloc() : super(CounterInitialState());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementCounterEvent) {
      _counter++;
      yield CounterValueState(_counter);
    } else if (event is DecrementCounterEvent) {
      _counter--;
      yield CounterValueState(_counter);
    } else if (event is SetCounterEvent) {
      _counter = event.value;
      yield CounterValueState(_counter);
    } else if (event is SecondScreenNavigationEvent) {
      yield SecondScreenNavigationState();
    }
  }
}
