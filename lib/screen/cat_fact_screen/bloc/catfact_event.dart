part of 'catfact_bloc.dart';

abstract class CatFactEvent extends Equatable {
  const CatFactEvent();

  @override
  List<Object> get props => [];
}

class CatFactInitialEvent extends CatFactEvent {}
