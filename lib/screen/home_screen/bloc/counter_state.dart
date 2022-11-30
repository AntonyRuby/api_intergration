part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  final int value;
  const CounterState([this.value]);

  @override
  List<Object> get props => [value];
}

class CounterInitialState extends CounterState {}

class CounterValueState extends CounterState {
  CounterValueState(int value) : super(value);
}

class SecondScreenNavigationState extends CounterState {}
