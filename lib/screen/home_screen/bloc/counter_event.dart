part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterInitialEvent extends CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

class SetCounterEvent extends CounterEvent {
  final int value;

  SetCounterEvent(this.value);
}

class SecondScreenNavigationEvent extends CounterEvent {}
