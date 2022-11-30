import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'secondscreen_event.dart';
part 'secondscreen_state.dart';

class SecondscreenBloc extends Bloc<SecondscreenEvent, SecondscreenState> {
  SecondscreenBloc() : super(SecondscreenInitialState());

  @override
  Stream<SecondscreenState> mapEventToState(
    SecondscreenEvent event,
  ) async* {}
}
