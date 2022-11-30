part of 'catfact_bloc.dart';

abstract class CatFactState extends Equatable {
  const CatFactState();

  @override
  List<Object> get props => [];
}

class CatFactInitialState extends CatFactState {}

class CatFactLoadingState extends CatFactState {}

class CatFactLoadedState extends CatFactState {
  // final List<CatFact> catFactData;
  // CatFactLoadedState({this.catFactData});
}

class CatFactFailureState extends CatFactState {
  // final String error;
  // CatFactFailureState(this.error);
}
