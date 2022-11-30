part of 'secondscreen_bloc.dart';

abstract class SecondscreenEvent extends Equatable {
  const SecondscreenEvent();

  @override
  List<Object> get props => [];
}

class SecondscreenInitialEvent extends SecondscreenEvent {}
